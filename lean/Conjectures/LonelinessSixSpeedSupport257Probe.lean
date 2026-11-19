import Conjectures.LonelinessModularInitialMemo
import Init.Data.RArray

/-! Complete prime-257 initial-support exclusion for minimum pair 20.
This is a small numerical probe for the full six-speed certificates.
The native trace supplies data; every numerical assertion is kernel checked. -/

namespace Loneliness.Modular.SixSpeed.SupportProbe

noncomputable section
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def inverseData : Lean.RArray ℕ :=
  (.branch 64
    (.branch 32
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf 0)
                (.leaf 1)
              )
              (.branch 3
                (.leaf 129)
                (.leaf 86)
              )
            )
            (.branch 6
              (.branch 5
                (.leaf 193)
                (.leaf 103)
              )
              (.branch 7
                (.leaf 43)
                (.leaf 147)
              )
            )
          )
          (.branch 12
            (.branch 10
              (.branch 9
                (.leaf 225)
                (.leaf 200)
              )
              (.branch 11
                (.leaf 180)
                (.leaf 187)
              )
            )
            (.branch 14
              (.branch 13
                (.leaf 150)
                (.leaf 178)
              )
              (.branch 15
                (.leaf 202)
                (.leaf 120)
              )
            )
          )
        )
        (.branch 24
          (.branch 20
            (.branch 18
              (.branch 17
                (.leaf 241)
                (.leaf 121)
              )
              (.branch 19
                (.leaf 100)
                (.leaf 230)
              )
            )
            (.branch 22
              (.branch 21
                (.leaf 90)
                (.leaf 49)
              )
              (.branch 23
                (.leaf 222)
                (.leaf 190)
              )
            )
          )
          (.branch 28
            (.branch 26
              (.branch 25
                (.leaf 75)
                (.leaf 72)
              )
              (.branch 27
                (.leaf 89)
                (.leaf 238)
              )
            )
            (.branch 30
              (.branch 29
                (.leaf 101)
                (.leaf 195)
              )
              (.branch 31
                (.leaf 60)
                (.leaf 199)
              )
            )
          )
        )
      )
      (.branch 48
        (.branch 40
          (.branch 36
            (.branch 34
              (.branch 33
                (.leaf 249)
                (.leaf 148)
              )
              (.branch 35
                (.leaf 189)
                (.leaf 235)
              )
            )
            (.branch 38
              (.branch 37
                (.leaf 50)
                (.leaf 132)
              )
              (.branch 39
                (.leaf 115)
                (.leaf 145)
              )
            )
          )
          (.branch 44
            (.branch 42
              (.branch 41
                (.leaf 45)
                (.leaf 163)
              )
              (.branch 43
                (.leaf 153)
                (.leaf 6)
              )
            )
            (.branch 46
              (.branch 45
                (.leaf 111)
                (.leaf 40)
              )
              (.branch 47
                (.leaf 95)
                (.leaf 175)
              )
            )
          )
        )
        (.branch 56
          (.branch 52
            (.branch 50
              (.branch 49
                (.leaf 166)
                (.leaf 21)
              )
              (.branch 51
                (.leaf 36)
                (.leaf 126)
              )
            )
            (.branch 54
              (.branch 53
                (.leaf 173)
                (.leaf 97)
              )
              (.branch 55
                (.leaf 119)
                (.leaf 243)
              )
            )
          )
          (.branch 60
            (.branch 58
              (.branch 57
                (.leaf 179)
                (.leaf 248)
              )
              (.branch 59
                (.leaf 226)
                (.leaf 61)
              )
            )
            (.branch 62
              (.branch 61
                (.leaf 30)
                (.leaf 59)
              )
              (.branch 63
                (.leaf 228)
                (.leaf 102)
              )
            )
          )
        )
      )
    )
    (.branch 96
      (.branch 80
        (.branch 72
          (.branch 68
            (.branch 66
              (.branch 65
                (.leaf 253)
                (.leaf 87)
              )
              (.branch 67
                (.leaf 74)
                (.leaf 234)
              )
            )
            (.branch 70
              (.branch 69
                (.leaf 223)
                (.leaf 149)
              )
              (.branch 71
                (.leaf 246)
                (.leaf 181)
              )
            )
          )
          (.branch 76
            (.branch 74
              (.branch 73
                (.leaf 25)
                (.leaf 169)
              )
              (.branch 75
                (.leaf 66)
                (.leaf 24)
              )
            )
            (.branch 78
              (.branch 77
                (.leaf 186)
                (.leaf 247)
              )
              (.branch 79
                (.leaf 201)
                (.leaf 244)
              )
            )
          )
        )
        (.branch 88
          (.branch 84
            (.branch 82
              (.branch 81
                (.leaf 151)
                (.leaf 165)
              )
              (.branch 83
                (.leaf 210)
                (.leaf 96)
              )
            )
            (.branch 86
              (.branch 85
                (.leaf 205)
                (.leaf 127)
              )
              (.branch 87
                (.leaf 3)
                (.leaf 65)
              )
            )
          )
          (.branch 92
            (.branch 90
              (.branch 89
                (.leaf 184)
                (.leaf 26)
              )
              (.branch 91
                (.leaf 20)
                (.leaf 209)
              )
            )
            (.branch 94
              (.branch 93
                (.leaf 176)
                (.leaf 152)
              )
              (.branch 95
                (.leaf 216)
                (.leaf 46)
              )
            )
          )
        )
      )
      (.branch 112
        (.branch 104
          (.branch 100
            (.branch 98
              (.branch 97
                (.leaf 83)
                (.leaf 53)
              )
              (.branch 99
                (.leaf 139)
                (.leaf 135)
              )
            )
            (.branch 102
              (.branch 101
                (.leaf 18)
                (.leaf 28)
              )
              (.branch 103
                (.leaf 63)
                (.leaf 5)
              )
            )
          )
          (.branch 108
            (.branch 106
              (.branch 105
                (.leaf 215)
                (.leaf 164)
              )
              (.branch 107
                (.leaf 177)
                (.leaf 245)
              )
            )
            (.branch 110
              (.branch 109
                (.leaf 188)
                (.leaf 224)
              )
              (.branch 111
                (.leaf 250)
                (.leaf 44)
              )
            )
          )
        )
        (.branch 120
          (.branch 116
            (.branch 114
              (.branch 113
                (.leaf 218)
                (.leaf 116)
              )
              (.branch 115
                (.leaf 124)
                (.leaf 38)
              )
            )
            (.branch 118
              (.branch 117
                (.leaf 113)
                (.leaf 134)
              )
              (.branch 119
                (.leaf 159)
                (.leaf 54)
              )
            )
          )
          (.branch 124
            (.branch 122
              (.branch 121
                (.leaf 15)
                (.leaf 17)
              )
              (.branch 123
                (.leaf 158)
                (.leaf 140)
              )
            )
            (.branch 126
              (.branch 125
                (.leaf 114)
                (.leaf 220)
              )
              (.branch 127
                (.leaf 51)
                (.branch 128
                  (.leaf 85)
                  (.leaf 255)
                )
              )
            )
          )
        )
      )
    )
  )
def inverse (a : ℕ) : ℕ := inverseData.get a

theorem inverse_checked : ∀ a : Fin 129, 0<a.val → (a.val*inverse a.val)%257=1 := by
  decide +kernel

def coverTable : Memo.Tree :=
  (.branch 64
    (.branch 32
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.entry 0 680564733841876926926749214863536422910)
                (.entry 1 137438953470)
              )
              (.branch 3
                (.entry 2 680562137693447659512934949615372337150)
                (.entry 3 316912631167591418895594954750)
              )
            )
            (.branch 6
              (.branch 5
                (.entry 4 679235505846092029943239281687799006206)
                (.entry 5 2596069201104900126353222551994622)
              )
              (.branch 7
                (.entry 6 669930909880548151174841227664229924990)
                (.entry 7 83036184917953811329641396398194750)
              )
            )
          )
          (.branch 12
            (.branch 10
              (.branch 9
                (.entry 8 659297088439667713848748472784130146334)
                (.entry 9 662017850696294863238231668650147870)
              )
              (.branch 11
                (.entry 10 638029598968388246941206452915767607310)
                (.entry 11 2637686960116156127145619869197664270)
              )
            )
            (.branch 14
              (.branch 13
                (.entry 12 595496697695861670075001041893499338766)
                (.entry 13 5233840145553866730577943295072010246)
              )
              (.branch 15
                (.entry 14 595504202225182012262106063999980208134)
                (.entry 15 10301595562269941585382994010272923654)
              )
            )
          )
        )
        (.branch 24
          (.branch 20
            (.branch 18
              (.branch 17
                (.entry 16 510462493202066992345869979576116428806)
                (.entry 17 20603338180095084450341868058966220806)
              )
              (.branch 19
                (.entry 18 510579324041143650786440800311196114950)
                (.entry 19 19940853974497116002487592658076233730)
              )
            )
            (.branch 22
              (.branch 21
                (.entry 20 510735126226771110880568169304172818434)
                (.entry 21 39881384242783182401267077721528219650)
              )
              (.branch 23
                (.entry 22 511005229680724152903980608703285966850)
                (.entry 23 37236566430529471445329702784618994690)
              )
            )
          )
          (.branch 28
            (.branch 26
              (.branch 25
                (.entry 24 511587193062757899305031677165169548290)
                (.entry 25 37254765469076416602460201288786251266)
              )
              (.branch 27
                (.entry 26 342610789763994738384433584972183899650)
                (.entry 27 74509602035762350489050653597160441346)
              )
            )
            (.branch 30
              (.branch 29
                (.entry 28 342280761065266952903230641119548933890)
                (.entry 29 74582395941211177511989672773088052994)
              )
              (.branch 31
                (.entry 30 344942488905227986209317035832716493570)
                (.entry 31 64094201108521847278445440047165670146)
              )
            )
          )
        )
      )
      (.branch 48
        (.branch 40
          (.branch 36
            (.branch 34
              (.branch 33
                (.entry 32 344285688884714210092355485168415507330)
                (.entry 33 64054453312491919296690567072509428098)
              )
              (.branch 35
                (.entry 34 349618239321522604331479564843221090690)
                (.entry 35 64305313850320763345946593472385433986)
              )
            )
            (.branch 38
              (.branch 37
                (.entry 36 348320531152229015798570375637643608450)
                (.entry 37 128610658363819261781432922493896646848)
              )
              (.branch 39
                (.entry 38 348300254491973474041363296236954738880)
                (.entry 39 128608123549217882630626466899089187008)
              )
            )
          )
          (.branch 44
            (.branch 42
              (.branch 41
                (.entry 40 345725856590764014863673815482041381056)
                (.entry 41 128286325695965666362198089014067343552)
              )
              (.branch 43
                (.entry 42 356486247949078819780838525331621818432)
                (.entry 43 129631377874643224176523659939101806656)
              )
            )
            (.branch 46
              (.branch 45
                (.entry 44 356484971764473619531061797463823620160)
                (.entry 45 128998412086908724254104253401227466848)
              )
              (.branch 47
                (.entry 46 351422524805006406576961890705398237280)
                (.entry 47 131637078312417267100664273755317667936)
              )
            )
          )
        )
        (.branch 56
          (.branch 52
            (.branch 50
              (.branch 49
                (.entry 48 351264244882200145363725328637321350240)
                (.entry 49 89184231442764310752067552231001525280)
              )
              (.branch 51
                (.entry 50 372526865562891678056940466881613106208)
                (.entry 51 87814804367971670611746097614577239072)
              )
            )
            (.branch 54
              (.branch 53
                (.entry 52 373212583571554538326979776768849773600)
                (.entry 53 87986315039397364209245185067825284128)
              )
              (.branch 55
                (.entry 54 362237387026061931741587159921170335264)
                (.entry 55 93217802767574426174914560102165399072)
              )
            )
          )
          (.branch 60
            (.branch 58
              (.branch 57
                (.entry 56 362257589773037138550973485181551002160)
                (.entry 57 90564387282284992380776536862299021872)
              )
              (.branch 59
                (.entry 58 362923464059041937391977343919243665968)
                (.entry 59 90897060044318563966963838763397423632)
              )
            )
            (.branch 62
              (.branch 61
                (.entry 60 362965089119792370406509527573278630672)
                (.entry 61 90742570280505938800359885861298512656)
              )
              (.branch 63
                (.entry 62 362967858640571308902658816681019912464)
                (.entry 63 260883147972719648586065418883290960144)
              )
            )
          )
        )
      )
    )
    (.branch 96
      (.branch 80
        (.branch 72
          (.branch 68
            (.branch 66
              (.branch 65
                (.entry 64 408338147998878351512365724851944624400)
                (.entry 65 266554520754735129712977076024876536080)
              )
              (.branch 67
                (.entry 66 385653349197530867241380072057923506448)
                (.entry 67 181483939841786925315862777097458587920)
              )
            )
            (.branch 70
              (.branch 69
                (.entry 68 385654041524245987501121627521634830608)
                (.entry 69 181486699601693676372133716474907363472)
              )
              (.branch 71
                (.entry 70 385996738487259485067409678800586573968)
                (.entry 71 181528582949063047887414519753980790928)
              )
            )
          )
          (.branch 76
            (.branch 74
              (.branch 73
                (.entry 72 385831975011605776650934207459402991760)
                (.entry 73 182198432682057792404967736573310552208)
              )
              (.branch 75
                (.entry 74 48228996886432223172685344441972704392)
                (.entry 75 182116010084967201896877201891858203784)
              )
            )
            (.branch 78
              (.branch 77
                (.entry 76 48231613496957603706419732343304635528)
                (.entry 77 171638036867837697181580209673299174536)
              )
              (.branch 79
                (.entry 78 48564247909112248334992657481041192072)
                (.entry 79 192927763640683460422892403472440828936)
              )
            )
          )
        )
        (.branch 88
          (.branch 84
            (.branch 82
              (.branch 81
                (.entry 80 48605832558871401630892943384745944136)
                (.entry 81 194257171665482627920883568389233647688)
              )
              (.branch 83
                (.entry 82 48611755113037683010493937317896061512)
                (.entry 83 194441503636756672679854470676638863944)
              )
            )
            (.branch 86
              (.branch 85
                (.entry 84 6076470837872530297746947829680869960)
                (.entry 85 194447066811964825470825545571546468936)
              )
              (.branch 87
                (.entry 86 370878347038201973466464023515720)
                (.entry 87 194447065363928687454972105511319933512)
              )
            )
          )
          (.branch 92
            (.branch 90
              (.branch 89
                (.entry 88 12152941664783190489981550233898750536)
                (.entry 89 194411462490118623062517678610337366600)
              )
              (.branch 91
                (.entry 90 97223255246956866362367332224634863688)
                (.entry 91 192168372862706961395762288973608798280)
              )
            )
            (.branch 94
              (.branch 93
                (.entry 92 97205730158700576498875568013371918600)
                (.entry 93 192167277069176928779136265595132594440)
              )
              (.branch 95
                (.entry 94 97081208568534392635831032082195826952)
                (.entry 95 176229487499717036225604314375274432776)
              )
            )
          )
        )
      )
      (.branch 112
        (.branch 104
          (.branch 100
            (.branch 98
              (.branch 97
                (.entry 96 96079727210156779101110538256381446440)
                (.entry 97 176146817948714296038596751227749474600)
              )
              (.branch 99
                (.entry 98 98706908422083413927632177267994861856)
                (.entry 99 175645690701260491033814609785375695136)
              )
            )
            (.branch 102
              (.branch 101
                (.entry 100 98788976315702248559334706223438374176)
                (.entry 101 218164925530074366787769278636492104736)
              )
              (.branch 103
                (.entry 102 87815139353585400197090313228371657760)
                (.entry 103 219537010916734487682314990219571528736)
              )
            )
          )
          (.branch 108
            (.branch 106
              (.branch 105
                (.entry 104 87836243446132229558133579067792983072)
                (.entry 105 214048919322247531540426180831312254112)
              )
              (.branch 107
                (.entry 106 88415267721367906480935157911510979744)
                (.entry 107 214390355715756100341832285400597139616)
              )
            )
            (.branch 110
              (.branch 109
                (.entry 108 107029024357244081717503618477493604512)
                (.entry 109 214351097291747416932534357368911712416)
              )
              (.branch 111
                (.entry 110 107175548636516051484527435411580539040)
                (.entry 111 53587774318248887405359548009518547588)
              )
            )
          )
        )
        (.branch 120
          (.branch 116
            (.branch 114
              (.branch 113
                (.entry 112 107212180829255233896392681936887300740)
                (.entry 113 53606085661483553329714291509744173700)
              )
              (.branch 115
                (.entry 114 111873654878039232447338164148757662340)
                (.entry 115 53278371129965404773325394407478004356)
              )
            )
            (.branch 118
              (.branch 117
                (.entry 116 111709697435629034729174077285107771908)
                (.entry 117 55854848698307437108682082803751332356)
              )
              (.branch 119
                (.entry 118 27927581614627299186156688543215299076)
                (.entry 119 56499086050599665654578479536701351940)
              )
            )
          )
          (.branch 124
            (.branch 122
              (.branch 121
                (.entry 120 28246956939144646156815666134116902932)
                (.entry 121 14123155523252894305524325691211554836)
              )
              (.branch 123
                (.entry 122 28349954356027651667128381153684914196)
                (.entry 123 14177568262327035833685265094244171860)
              )
            )
            (.branch 126
              (.branch 125
                (.entry 124 7089107817872824135914113941005926740)
                (.entry 125 886151152095991361338821356686411092)
              )
              (.branch 127
                (.entry 126 110768999236096358838174647469495636)
                (.branch 128
                  (.entry 127 865382809755801530297737125647700)
                  (.entry 128 6296488643826193618260)
                )
              )
            )
          )
        )
      )
    )
  )

def compatibleTable : Memo.Tree :=
  (.branch 5185
    (.branch 5162
      (.branch 5149
        (.branch 5142
          (.branch 5140
            (.entry 5121 336293211191158722840016935591351418880)
            (.branch 5141
              (.entry 5140 583307647557267818339147860839855160258)
              (.entry 5141 379617705120463301825346910261497233238)
            )
          )
          (.branch 5145
            (.branch 5144
              (.entry 5142 626885257744812886491672548051251066746)
              (.entry 5144 497785408001504589561639710032370986530)
            )
            (.branch 5148
              (.entry 5145 552356335608365906104211272077026262878)
              (.entry 5148 632541013995459571659000162305994603338)
            )
          )
        )
        (.branch 5155
          (.branch 5153
            (.branch 5151
              (.entry 5149 678791157387127122595360161384030007022)
              (.entry 5151 651245755131081361687511396404149542398)
            )
            (.branch 5154
              (.entry 5153 625053765794001662646489880663778834294)
              (.entry 5154 633417293537162474849590745017334726634)
            )
          )
          (.branch 5159
            (.branch 5156
              (.entry 5155 200460180845309691400644563404817688414)
              (.entry 5156 648318896734510886277265228485273176450)
            )
            (.branch 5161
              (.entry 5159 653811746031848776233427501591235059574)
              (.entry 5161 669798153888928800250855728304450955006)
            )
          )
        )
      )
      (.branch 5171
        (.branch 5167
          (.branch 5164
            (.entry 5162 549874376601406291678075046932458191638)
            (.branch 5165
              (.entry 5164 621577477822515050848546595474772047726)
              (.entry 5165 566167303955984988599523811441425997206)
            )
          )
          (.branch 5169
            (.branch 5168
              (.entry 5167 674444922211427723880760139260416638966)
              (.entry 5168 510162545151062477789547393206898173606)
            )
            (.branch 5170
              (.entry 5169 622074771824467534665240098520499277694)
              (.entry 5170 337021430438711666098747710633320364894)
            )
          )
        )
        (.branch 5178
          (.branch 5173
            (.branch 5172
              (.entry 5171 679223380365759279099479211854182350754)
              (.entry 5172 651974129165106851296813047157232754086)
            )
            (.branch 5174
              (.entry 5173 505077983947176610393830167392215166718)
              (.entry 5174 645940216563591495437905490717833911730)
            )
          )
          (.branch 5181
            (.branch 5179
              (.entry 5178 659190195548288515028533934117281922814)
              (.entry 5179 674806473205921541273919288317904025582)
            )
            (.branch 5182
              (.entry 5181 566198404853430715958016858434983403006)
              (.entry 5182 616044360096173788852189278028317810174)
            )
          )
        )
      )
    )
    (.branch 5213
      (.branch 5196
        (.branch 5188
          (.branch 5186
            (.entry 5185 480806521689979419663162186734340328854)
            (.branch 5187
              (.entry 5186 626972421345772398374440679468751501118)
              (.entry 5187 669756619284973396060680673543750673406)
            )
          )
          (.branch 5191
            (.branch 5189
              (.entry 5188 325276547313050423078399079204282793582)
              (.entry 5189 550793454344011707354507813323716161406)
            )
            (.branch 5195
              (.entry 5191 637477389678000707809237832568359746430)
              (.entry 5195 337040913087472142302413490501382509534)
            )
          )
        )
        (.branch 5205
          (.branch 5201
            (.branch 5198
              (.entry 5196 623648032836273950756250372984288835438)
              (.entry 5198 653271746708456159567590833383880498622)
            )
            (.branch 5202
              (.entry 5201 561556559632499797973438091368247244278)
              (.entry 5202 594026321231923389435385115072293435390)
            )
          )
          (.branch 5211
            (.branch 5208
              (.entry 5205 679214572603464115176467592035660065418)
              (.entry 5208 478394213032111954884687142442755921534)
            )
            (.branch 5212
              (.entry 5211 576458973851569433962266326296153741150)
              (.entry 5212 510228491709225648994562088695422679030)
            )
          )
        )
      )
      (.branch 5228
        (.branch 5219
          (.branch 5216
            (.branch 5214
              (.entry 5213 636645933846477908129512355258267729886)
              (.entry 5214 637187427666084638763279734854741647294)
            )
            (.branch 5218
              (.entry 5216 398602239438728402933940258454835752630)
              (.entry 5218 653976903060619715829242750480920057726)
            )
          )
          (.branch 5222
            (.branch 5221
              (.entry 5219 668178494869366027380384693811915650554)
              (.entry 5221 242540609161608265883921815961045552638)
            )
            (.branch 5226
              (.entry 5222 678870650071905469185705280022840733358)
              (.entry 5226 395444421057424578997509308216023900150)
            )
          )
        )
        (.branch 5239
          (.branch 5234
            (.branch 5231
              (.entry 5228 669217780179997481803208261740078523822)
              (.entry 5231 542154933037150593256547671338163105726)
            )
            (.branch 5238
              (.entry 5234 679457470192746982893410261374068053930)
              (.entry 5238 382463242094642621383274474884172865278)
            )
          )
          (.branch 5245
            (.branch 5242
              (.entry 5239 316828311934852702187144543088045047646)
              (.entry 5242 332088171630388502845245675744035298782)
            )
            (.branch 5247
              (.entry 5245 297323229352919070540899257698488395646)
              (.entry 5247 145835097381480974719327679699691981238)
            )
          )
        )
      )
    )
  )

theorem cover_checked : Memo.check (InitialBits.cover 7 257) coverTable=true := by
  decide +kernel

theorem compatible_checked :
    Memo.check (InitialMemo.compatibleBase 257 inverse 256) compatibleTable=true := by
  decide +kernel

def nodeData : Lean.RArray SupportSearch.Tape.Node :=
  (.branch 85
    (.branch 42
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf (.leaf (.capacity 14)))
                (.leaf (.leaf (.capacity 11)))
              )
              (.branch 3
                (.leaf (.leaf (.capacity 10)))
                (.branch 4
                  (.leaf (.leaf (.capacity 12)))
                  (.leaf (.leaf (.capacity 13)))
                )
              )
            )
            (.branch 7
              (.branch 6
                (.leaf (.leaf (.capacity 15)))
                (.leaf (.leaf (.capacity 9)))
              )
              (.branch 8
                (.leaf (.leaf (.capacity 8)))
                (.branch 9
                  (.leaf (.leaf (.witness 75)))
                  (.leaf (.leaf (.witness 41)))
                )
              )
            )
          )
          (.branch 15
            (.branch 12
              (.branch 11
                (.leaf (.leaf (.capacity 7)))
                (.leaf (.leaf (.witness 70)))
              )
              (.branch 13
                (.leaf (.leaf (.witness 118)))
                (.branch 14
                  (.leaf (.leaf (.witness 55)))
                  (.leaf (.leaf (.witness 48)))
                )
              )
            )
            (.branch 18
              (.branch 16
                (.leaf (.split 127 8 0))
                (.branch 17
                  (.leaf (.leaf (.witness 107)))
                  (.leaf (.leaf (.witness 96)))
                )
              )
              (.branch 19
                (.leaf (.split 93 8 10))
                (.branch 20
                  (.leaf (.split 58 18 1))
                  (.leaf (.split 45 19 6))
                )
              )
            )
          )
        )
        (.branch 31
          (.branch 26
            (.branch 23
              (.branch 22
                (.leaf (.split 41 20 2))
                (.leaf (.split 119 9 21))
              )
              (.branch 24
                (.leaf (.split 106 22 4))
                (.branch 25
                  (.leaf (.split 101 23 3))
                  (.leaf (.split 82 24 0))
                )
              )
            )
            (.branch 28
              (.branch 27
                (.leaf (.split 81 25 4))
                (.leaf (.split 49 3 7))
              )
              (.branch 29
                (.leaf (.split 69 26 27))
                (.branch 30
                  (.leaf (.split 62 28 3))
                  (.leaf (.split 31 29 0))
                )
              )
            )
          )
          (.branch 36
            (.branch 33
              (.branch 32
                (.leaf (.split 118 17 30))
                (.leaf (.split 93 15 4))
              )
              (.branch 34
                (.leaf (.split 82 32 4))
                (.branch 35
                  (.leaf (.split 69 33 0))
                  (.leaf (.split 62 34 0))
                )
              )
            )
            (.branch 39
              (.branch 37
                (.leaf (.split 58 35 0))
                (.branch 38
                  (.leaf (.split 21 36 3))
                  (.leaf (.split 102 31 37))
                )
              )
              (.branch 40
                (.leaf (.split 102 14 0))
                (.branch 41
                  (.leaf (.split 85 39 4))
                  (.leaf (.split 81 40 0))
                )
              )
            )
          )
        )
      )
      (.branch 63
        (.branch 52
          (.branch 47
            (.branch 44
              (.branch 43
                (.leaf (.split 69 41 0))
                (.leaf (.split 65 42 4))
              )
              (.branch 45
                (.leaf (.split 54 43 0))
                (.branch 46
                  (.leaf (.split 53 44 4))
                  (.leaf (.split 22 45 3))
                )
              )
            )
            (.branch 49
              (.branch 48
                (.leaf (.split 99 38 46))
                (.leaf (.split 108 13 4))
              )
              (.branch 50
                (.leaf (.split 98 48 3))
                (.branch 51
                  (.leaf (.split 66 49 3))
                  (.leaf (.split 52 50 4))
                )
              )
            )
          )
          (.branch 57
            (.branch 54
              (.branch 53
                (.leaf (.split 47 51 3))
                (.leaf (.split 42 52 3))
              )
              (.branch 55
                (.leaf (.split 33 53 4))
                (.branch 56
                  (.leaf (.split 96 47 54))
                  (.leaf (.leaf (.witness 98)))
                )
              )
            )
            (.branch 60
              (.branch 58
                (.leaf (.split 118 56 3))
                (.branch 59
                  (.leaf (.split 92 57 4))
                  (.leaf (.split 81 58 0))
                )
              )
              (.branch 61
                (.leaf (.split 71 59 4))
                (.branch 62
                  (.leaf (.split 68 60 1))
                  (.leaf (.split 58 61 3))
                )
              )
            )
          )
        )
        (.branch 74
          (.branch 68
            (.branch 65
              (.branch 64
                (.leaf (.split 34 62 4))
                (.leaf (.split 29 63 3))
              )
              (.branch 66
                (.leaf (.split 21 64 3))
                (.branch 67
                  (.leaf (.split 94 55 65))
                  (.leaf (.split 92 56 3))
                )
              )
            )
            (.branch 71
              (.branch 69
                (.leaf (.split 81 67 3))
                (.branch 70
                  (.leaf (.split 76 68 4))
                  (.leaf (.split 71 69 4))
                )
              )
              (.branch 72
                (.leaf (.split 50 70 3))
                (.branch 73
                  (.leaf (.split 42 71 0))
                  (.leaf (.split 39 72 1))
                )
              )
            )
          )
          (.branch 79
            (.branch 76
              (.branch 75
                (.leaf (.split 34 73 3))
                (.leaf (.split 21 74 4))
              )
              (.branch 77
                (.leaf (.split 91 66 75))
                (.branch 78
                  (.leaf (.split 118 14 4))
                  (.leaf (.split 101 77 4))
                )
              )
            )
            (.branch 82
              (.branch 80
                (.leaf (.split 96 78 3))
                (.branch 81
                  (.leaf (.split 91 79 4))
                  (.leaf (.split 85 80 4))
                )
              )
              (.branch 83
                (.leaf (.split 65 81 3))
                (.branch 84
                  (.leaf (.split 54 82 4))
                  (.leaf (.split 88 76 83))
                )
              )
            )
          )
        )
      )
    )
    (.branch 128
      (.branch 106
        (.branch 95
          (.branch 90
            (.branch 87
              (.branch 86
                (.leaf (.split 111 12 3))
                (.leaf (.split 98 85 4))
              )
              (.branch 88
                (.leaf (.split 96 86 4))
                (.branch 89
                  (.leaf (.split 85 87 4))
                  (.leaf (.split 76 88 1))
                )
              )
            )
            (.branch 92
              (.branch 91
                (.leaf (.split 61 89 0))
                (.leaf (.split 52 90 4))
              )
              (.branch 93
                (.leaf (.split 22 91 0))
                (.branch 94
                  (.leaf (.split 78 84 92))
                  (.leaf (.split 127 16 4))
                )
              )
            )
          )
          (.branch 100
            (.branch 97
              (.branch 96
                (.leaf (.split 125 94 4))
                (.leaf (.split 108 95 0))
              )
              (.branch 98
                (.leaf (.split 76 1 10))
                (.branch 99
                  (.leaf (.split 69 97 6))
                  (.leaf (.split 106 96 98))
                )
              )
            )
            (.branch 103
              (.branch 101
                (.leaf (.split 101 99 4))
                (.branch 102
                  (.leaf (.split 82 100 0))
                  (.leaf (.split 41 101 4))
                )
              )
              (.branch 104
                (.leaf (.split 36 102 4))
                (.branch 105
                  (.leaf (.split 29 103 4))
                  (.leaf (.split 75 93 104))
                )
              )
            )
          )
        )
        (.branch 117
          (.branch 111
            (.branch 108
              (.branch 107
                (.leaf (.split 125 11 0))
                (.leaf (.split 118 106 4))
              )
              (.branch 109
                (.leaf (.split 114 107 0))
                (.branch 110
                  (.leaf (.split 106 108 0))
                  (.leaf (.split 99 109 4))
                )
              )
            )
            (.branch 114
              (.branch 112
                (.leaf (.split 92 110 0))
                (.branch 113
                  (.leaf (.split 66 111 3))
                  (.leaf (.split 62 112 0))
                )
              )
              (.branch 115
                (.leaf (.split 29 113 4))
                (.branch 116
                  (.leaf (.split 67 105 114))
                  (.leaf (.split 108 13 3))
                )
              )
            )
          )
          (.branch 122
            (.branch 119
              (.branch 118
                (.leaf (.split 98 116 0))
                (.leaf (.split 94 117 3))
              )
              (.branch 120
                (.leaf (.split 75 118 1))
                (.branch 121
                  (.leaf (.split 61 119 3))
                  (.leaf (.split 52 120 3))
                )
              )
            )
            (.branch 125
              (.branch 123
                (.leaf (.split 47 121 3))
                (.branch 124
                  (.leaf (.split 28 122 4))
                  (.leaf (.split 59 115 123))
                )
              )
              (.branch 126
                (.leaf (.split 118 14 3))
                (.branch 127
                  (.leaf (.split 101 125 3))
                  (.leaf (.split 91 126 3))
                )
              )
            )
          )
        )
      )
      (.branch 149
        (.branch 138
          (.branch 133
            (.branch 130
              (.branch 129
                (.leaf (.split 85 127 3))
                (.leaf (.split 81 128 4))
              )
              (.branch 131
                (.leaf (.split 75 129 4))
                (.branch 132
                  (.leaf (.split 69 130 4))
                  (.leaf (.split 65 131 3))
                )
              )
            )
            (.branch 135
              (.branch 134
                (.leaf (.split 54 132 4))
                (.leaf (.split 21 133 3))
              )
              (.branch 136
                (.leaf (.split 51 124 134))
                (.branch 137
                  (.leaf (.split 122 13 4))
                  (.leaf (.split 108 136 0))
                )
              )
            )
          )
          (.branch 143
            (.branch 140
              (.branch 139
                (.leaf (.split 94 137 4))
                (.leaf (.split 75 138 4))
              )
              (.branch 141
                (.leaf (.split 66 139 4))
                (.branch 142
                  (.leaf (.split 52 140 4))
                  (.leaf (.split 47 141 4))
                )
              )
            )
            (.branch 146
              (.branch 144
                (.leaf (.split 42 142 3))
                (.branch 145
                  (.leaf (.split 33 143 5))
                  (.leaf (.split 28 144 3))
                )
              )
              (.branch 147
                (.leaf (.split 48 135 145))
                (.branch 148
                  (.leaf (.split 119 9 0))
                  (.leaf (.split 101 147 3))
                )
              )
            )
          )
        )
        (.branch 160
          (.branch 154
            (.branch 151
              (.branch 150
                (.leaf (.split 76 148 0))
                (.leaf (.split 75 149 3))
              )
              (.branch 152
                (.leaf (.split 69 150 0))
                (.branch 153
                  (.leaf (.split 51 151 4))
                  (.leaf (.split 50 152 3))
                )
              )
            )
            (.branch 157
              (.branch 155
                (.leaf (.split 44 153 4))
                (.branch 156
                  (.leaf (.split 31 154 0))
                  (.leaf (.split 25 155 3))
                )
              )
              (.branch 158
                (.leaf (.split 35 146 156))
                (.branch 159
                  (.leaf (.split 118 14 1))
                  (.leaf (.split 102 158 4))
                )
              )
            )
          )
          (.branch 165
            (.branch 162
              (.branch 161
                (.leaf (.split 101 159 3))
                (.leaf (.split 91 160 4))
              )
              (.branch 163
                (.leaf (.split 85 161 4))
                (.branch 164
                  (.leaf (.split 81 162 3))
                  (.leaf (.split 75 163 3))
                )
              )
            )
            (.branch 168
              (.branch 166
                (.leaf (.split 69 164 0))
                (.branch 167
                  (.leaf (.split 59 165 3))
                  (.leaf (.split 54 166 4))
                )
              )
              (.branch 169
                (.leaf (.split 22 167 4))
                (.branch 170
                  (.leaf (.split 21 168 1))
                  (.leaf (.split 24 157 169))
                )
              )
            )
          )
        )
      )
    )
  )
def lookup (index : ℕ) : SupportSearch.Tape.Node := nodeData.get index

def tree : SupportSearch.Tree :=
  SupportSearch.Tape.toTree lookup 256 170

/- The initial states are checked separately before the tape uses their numerals. -/
theorem selected_mask_checked : InitialBits.encode (InitialSupport.selected 20) = 1048578 := by
  decide +kernel
theorem available_mask_checked : InitialBits.encode (InitialSupport.available 257 inverse 20) = 240365526570467516971528776803692838912 := by
  decide +kernel
theorem uncovered_mask_checked : InitialBits.encode (InitialSupport.uncovered 7 257 20) = 169829607615105816046181045422176337920 := by
  decide +kernel

theorem tape_checked :
    SupportSearch.Bits.tapeCheck (InitialMemo.cover 7 257 coverTable)
      (InitialMemo.compatible 257 inverse 256 compatibleTable 20)
      (fun _ _ => false) lookup 256 170
      (InitialBits.encode (InitialSupport.selected 20))
      (InitialBits.encode (InitialSupport.available 257 inverse 20))
      (InitialBits.encode (InitialSupport.uncovered 7 257 20)) 4=true := by
  rw [selected_mask_checked,available_mask_checked,uncovered_mask_checked]
  decide +kernel

theorem tree_checked :
    SupportSearch.check (InitialSupport.badTimes 7 257)
      (InitialSupport.pairCompatible 257 inverse 20) (fun _ _ => false)
      tree (InitialSupport.selected 20) (InitialSupport.available 257 inverse 20)
      (InitialSupport.uncovered 7 257 20) 4=true := by
  exact InitialMemo.checked_tree 7 257 inverse 256 (by decide) coverTable compatibleTable
    cover_checked compatible_checked 20 (fun _ _ => false) lookup 256 170 4 tape_checked

theorem normalized_cover_impossible (s : Finset ℕ) (hs : FoldedSupport 257 s)
    (hcard : s.card≤6) (hone : 1∈s) (hb : 20∈s)
    (hmin : ∀ a∈s, a≠1 → 20≤a)
    (hpair : ∀ a∈s, ∀ c∈s, a≠c → 20≤folded 257 (inverse a*c)) :
    ¬InitialSupport.times 257⊆s.biUnion (InitialSupport.badTimes 7 257) := by
  intro hcover
  have ht : ∀ (s : Finset ℕ) (index : ℕ), (fun _ _ => false) s index=true → False := by
    intro _s _index hcheck
    cases hcheck
  exact InitialSupport.checked_normalized_support 6 7 257 (by decide) inverse 20
    (fun _ _ => false) (fun _ => False) ht tree tree_checked s hs hcard hone hb
    (by decide) hmin hpair hcover

end
end Loneliness.Modular.SixSpeed.SupportProbe
