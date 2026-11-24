"""Exact bounded rational-root certificate via Hensel lifts and 2D lattices.

No irreducible factorization or floating-point reduction is used.
"""
from math import gcd, isqrt


def evaluate_mod(coefficients, value, modulus):
    result = 0
    for coefficient in coefficients:
        result = (result*value+coefficient) % modulus
    return result


def dot(a, b):
    return a[0]*b[0]+a[1]*b[1]


def gauss_reduce(modulus, residue):
    a, b = (modulus, 0), (residue, 1)
    steps = 0
    while True:
        if dot(b, b) < dot(a, a):
            a, b = b, a
        norm = dot(a, a)
        multiple = (2*dot(a, b)+norm)//(2*norm)
        if multiple == 0:
            break
        b = (b[0]-multiple*a[0], b[1]-multiple*a[1])
        steps += 1
    assert dot(a, a) <= dot(b, b)
    assert 2*abs(dot(a, b)) <= dot(a, a)
    assert abs(a[0]*b[1]-a[1]*b[0]) == modulus
    assert (a[0]-residue*a[1]) % modulus == 0
    assert (b[0]-residue*b[1]) % modulus == 0
    return a, b, steps


def rational_zero(coefficients, numerator, denominator):
    value = coefficients[0]
    denominator_power = 1
    for coefficient in coefficients[1:]:
        denominator_power *= denominator
        value = value*numerator+coefficient*denominator_power
    return value == 0


def certify(coefficients, prime):
    coefficients = list(map(int, coefficients))
    degree = len(coefficients)-1
    derivative = [coefficient*(degree-i) for i,coefficient in enumerate(coefficients[:-1])]
    assert prime>1 and all(prime%d for d in range(2,isqrt(prime)+1))
    assert coefficients[0] % prime and coefficients[-1]
    height = max(abs(coefficients[0]), abs(coefficients[-1]))
    roots_mod_prime = [a for a in range(prime) if evaluate_mod(coefficients,a,prime)==0]
    assert all(evaluate_mod(derivative,a,prime) for a in roots_mod_prime)
    branches, rational_roots = [], []
    for initial in roots_mod_prime:
        modulus, residue = prime, initial
        while modulus <= 2*height*height:
            next_modulus = modulus*modulus
            value = evaluate_mod(coefficients,residue,next_modulus)
            slope = evaluate_mod(derivative,residue,next_modulus)
            residue = (residue-value*pow(slope,-1,next_modulus)) % next_modulus
            modulus = next_modulus
            assert evaluate_mod(coefficients,residue,modulus)==0
        a, b, steps = gauss_reduce(modulus,residue)
        branch = {'root_mod_prime': initial, 'modulus': str(modulus),
                  'lift': str(residue), 'basis': [[str(c) for c in a],[str(c) for c in b]],
                  'reduction_steps': steps}
        if dot(a,a) > 2*height*height:
            branch['exclusion'] = 'shortest_norm_exceeds_box_bound'
        else:
            content = gcd(a[0],a[1])
            numerator, denominator = a[0]//content,a[1]//content
            if denominator < 0:
                numerator,denominator=-numerator,-denominator
            branch['primitive_direction'] = [str(numerator),str(denominator)]
            admissible = (denominator>0 and abs(numerator)<=height and denominator<=height
                          and (numerator-residue*denominator)%modulus==0)
            if admissible and rational_zero(coefficients,numerator,denominator):
                branch['exclusion'] = None
                rational_roots.append([str(numerator),str(denominator)])
            else:
                branch['exclusion'] = 'only_primitive_direction_is_not_a_root'
        branches.append(branch)
    return {'degree': degree, 'prime': prime, 'height_bound': str(height),
            'roots_mod_prime': roots_mod_prime, 'branches': branches,
            'rational_roots': rational_roots}


def verify_saved_exclusion(coefficients, certificate):
    """Verify the saved no-root data without rerunning lift or reduction algorithms."""
    coefficients=list(map(int,coefficients))
    degree=len(coefficients)-1
    prime=int(certificate['prime'])
    height=max(abs(coefficients[0]),abs(coefficients[-1]))
    assert prime>1 and all(prime%d for d in range(2,isqrt(prime)+1))
    assert degree==certificate['degree'] and coefficients[0]%prime and coefficients[-1]
    assert str(height)==certificate['height_bound']
    derivative=[coefficients[i]*(degree-i) for i in range(degree)]
    roots=[a for a in range(prime) if evaluate_mod(coefficients,a,prime)==0]
    assert roots==certificate['roots_mod_prime']
    assert len(roots)==len(certificate['branches'])
    assert all(evaluate_mod(derivative,a,prime) for a in roots)
    for root,branch in zip(roots,certificate['branches']):
        assert root==branch['root_mod_prime']
        modulus,residue=int(branch['modulus']),int(branch['lift'])
        power=modulus
        while power%prime==0:
            power//=prime
        assert power==1 and modulus>2*height*height
        assert residue%prime==root and evaluate_mod(coefficients,residue,modulus)==0
        a,b=[tuple(map(int,vector)) for vector in branch['basis']]
        assert (a[0]-residue*a[1])%modulus==0
        assert (b[0]-residue*b[1])%modulus==0
        assert abs(a[0]*b[1]-a[1]*b[0])==modulus
        assert dot(a,a)<=dot(b,b) and 2*abs(dot(a,b))<=dot(a,a)
        assert dot(a,a)>2*height*height
        assert branch['exclusion']=='shortest_norm_exceeds_box_bound'
    assert certificate['rational_roots']==[]
    return True


if __name__=='__main__':
    import argparse,json
    parser=argparse.ArgumentParser()
    parser.add_argument('--source',default='bremner_complement_certificate.json')
    parser.add_argument('--degree',type=int,default=164)
    parser.add_argument('--prime',type=int,default=11)
    parser.add_argument('--output',default='bremner_complement_root_certificate.json')
    parser.add_argument('--verify',action='store_true')
    args=parser.parse_args()
    with open(args.source) as file:
        data=json.load(file)
    factor=next(f for f in data['squarefree_analysis'] if f['degree']==args.degree)
    if args.verify:
        with open(args.output) as file:
            certificate=json.load(file)
        print({'saved_certificate_valid':verify_saved_exclusion(factor['coefficients'],certificate)})
        raise SystemExit(0)
    certificate=certify(factor['coefficients'],args.prime)
    with open(args.output,'w') as file:
        json.dump(certificate,file,indent=2)
        file.write('\n')
    print({'degree':certificate['degree'],'prime':certificate['prime'],
           'rational_roots':certificate['rational_roots'],
           'branches':[(b['root_mod_prime'],b['exclusion'],b['reduction_steps'])
                       for b in certificate['branches']]})
