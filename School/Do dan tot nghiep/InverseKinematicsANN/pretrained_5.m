function [Y,Xf,Af] = pretrained_5(X,~,~)
%PRETRAINED_5 neural network simulation function.
%
% Auto-generated by MATLAB, 28-Nov-2023 15:33:13.
% 
% [Y] = pretrained_5(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 3xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0.050015307656058;0;-1.23446474292743e-08];
x1_step1.gain = [9.52646325174905;13.3352351375338;8.00068759389222];
x1_step1.ymin = -1;

% Layer 1
b1 = [5.5455198635998330658;4.8828929879942490899;-4.7442314080966205836;4.5706533898560470774;4.6280187504565271084;-4.4365458281576595212;-4.0773237347164341671;3.6858143899212332251;-3.4946181740139659055;3.3225171837421836329;3.1080004325265071508;2.4596826834535647777;-2.6288761702089433747;-2.7919096368701041833;-1.9343802346204319598;1.9541795695010664158;1.6285152329839940322;1.758191195588301392;-1.5322829429805924217;-0.8701654145896663417;1.2012190275689729191;-0.48807257788228547435;0.026727336196904101506;0.93167222304510433073;0.036406807852915334944;-0.44122847599256764806;0.15514953971370123997;-0.56500645448003805615;-0.95672982402761719278;-0.78510815035237513371;1.2218006784358883543;-1.1060373166990646876;1.1088301862175673485;-1.5758702735114775706;1.8754328467010912274;1.9085447023884776208;-2.39705247036303426;2.3557986601313305464;-2.9945825515528046168;-2.3212069561333166234;-2.7867422934859176209;-3.6033918688261752372;3.7995302903760452828;3.9882025387234030234;-4.4151423843743149433;4.3229841056208790917;4.5801398563019768417;4.8982625424660657387;5.0492016483737778287;-4.6937370832629232709];
IW1_1 = [-3.6489202022988256324 -0.98832904308158164852 -3.0766805016912504023;-2.950559813025401823 2.4853065436248957809 2.4616506793393209129;2.7457587247510533146 4.0529881967213530203 1.6152369262476440337;-0.33289692696030748209 4.9130616054047431263 0.85396811354935209248;-4.6076399446619742406 -0.31931228240999554036 -1.8595024286708983219;3.9633107680190269306 1.3721901488808001535 2.5633844305239041894;1.2700702522839344422 3.5844121052718453946 -2.4063420178846728348;-2.5163831052879244154 -3.9030542055751098474 -2.2450579645022386011;3.1761867311545044501 -2.8447995916536923389 -2.4805812829777869055;-2.7123959119240144133 -2.877862078257082068 -3.30041087347330242;-2.3438726444804371951 3.3558704301537667369 2.258804427253759517;-1.2180383036153088483 -3.8856811531120230008 2.6577240155826284962;1.0059206476789339657 -1.8788493937101937714 -4.2354149345869833709;3.778074922510902045 -0.00928223867885803397 -2.5093518507388790084;3.2868942228076578616 1.7467666858334052193 -2.8824171160558855753;-3.3270504515689953706 -0.90906169075879239561 3.4367298822416407766;-3.9431664867631632809 -1.911793924144883583 2.4306842814953215637;-4.4332110714857888567 -1.2385718287273246307 -1.7460769286717288118;3.9142856413353510625 -1.1258907470953336549 2.6406677299655494373;1.6864872372655315136 -4.5555996062404648939 1.9360315132835086427;-3.5595214856799421987 -2.9634112854677749915 0.67759926354722288533;3.3889118174580370457 0.62414568023267280594 3.2848017473454613757;-2.9320810372570869085 1.3626567213874245521 2.3150807473171197692;0.10764426965554296789 4.7896401160961392662 0.041871370529381543579;-0.93914920156951575692 0.066731482659328836271 -4.3462190336897164045;0.27525462605599820831 -1.9631836709481378378 4.0633128887012883723;-3.1921570621969923565 -2.5450315575769044685 -2.7732704613129537385;-1.7061561794726385344 -4.8839072924126121222 -0.28474495212466677252;-3.4809389495434270856 -3.4153684274556201927 -1.9070029250274149746;-2.9631938183416051125 -2.2515467222251044355 3.0386775535612322585;3.4343637438583245469 0.74666148713354874022 3.0006047102398079041;-4.2621518675991758585 0.76966084819689972729 2.7721306884698000417;3.3396666364843539121 2.2055149028174945158 3.2348627187536336258;-1.380965964388292111 0.84223210407556892143 -4.1598062890479585718;1.9539268730574419486 -4.2954424097089667356 1.9799231482707080332;4.5613650814253707821 1.5487032132607287949 0.2870076999877145818;-2.8727127967990493396 -3.8682377951320243703 -1.4706982698692301348;3.7119009715063562282 -3.3419025029486100209 2.6975110852562727004;-1.5489719230130514216 -4.1230029107845380665 -2.3059668620653042126;-3.8833880838419343462 2.2085022666734324126 -2.3633710007263468711;0.1298601647974834683 -3.8898638623101358114 -2.2943574304932652375;-0.45607169620990850589 2.5276319180789110774 -4.3147754106830902288;3.2140482794342668527 -2.4856789471765519117 -2.4422505660123703386;2.1201113215864584305 -3.8386725061417728 -2.6476673420619349919;-1.9420450601923164857 -4.2700100278732371351 1.5664056641790276014;1.5252695056748974967 -3.594901408883239835 -3.3674254472141011973;1.3351715822512779663 -2.8045059167822876667 -4.0855973743076896554;2.9134828073354288591 -2.2834956949106173241 -3.4402859833576537874;2.3513457276031966003 3.5364586800944266543 2.0276207820219958045;-1.7403817907215677341 -3.9245928515013068782 2.2045967531734573797];

% Layer 2
b2 = [0.57212681033370571537;0.71817175180626102726;0.29514979322623607905];
LW2_1 = [-0.52214863917469978016 -0.60790641611894469243 -1.0761071888513076278 -0.064863953183709299743 0.026294392719176405693 0.52846356204063271722 -0.014070315286296413565 0.12854951539276265882 -0.06464479200817283 -0.7641124539754936551 0.31938690900076982526 -0.54032431995793850366 0.0018259023792085574741 -0.23211384989002112333 -0.084549032463040241225 0.25314606897124192209 0.010733702728354645173 0.022265321728686903596 0.0014911794070840448875 -0.58528511257582038763 -0.0035696968851512854079 -0.6705018526752024588 0.27842439207659869238 0.062622305409636314089 -0.002377035452957994028 0.0064789933233355568448 0.018917516843978198632 0.27583213801089695449 -0.054892388567387553899 0.059398321147042049128 -0.0061083640138376096851 -0.094088620853308629899 0.68818489136219440638 -0.010398891195760793377 0.0034156401455470546125 -0.0068521462537304783993 0.017888307976815714245 0.64320403174005058577 0.050926124885228553352 0.020404124736336383406 -0.10011856541504865481 0.25338803862155201418 0.49769760977167581961 -0.81770050509848157816 -0.44683634023991980477 -0.1277377958523790713 0.52914073780105697065 -0.54669286573097353177 -0.0085700200583641861218 -0.19219259634439336826;0.30055662978812147657 0.074419096257310385356 -0.61685563779722896172 0.71115275771274533145 0.22178813447848366724 -0.25706828051810426405 0.00039001118063900462596 -0.53622334482889100205 -0.036362426014220419757 -1.0630532286275349296 0.11457870177400396317 -0.52979852698638740804 -0.10528694324462836707 0.03041315164034761459 -0.14213239306971514608 -0.020547065603594219518 -0.11448626695320995861 0.019249573633793936461 -0.039517676458408305951 0.19552601344631886926 0.1865648332918753427 0.39932397776455452743 -0.12823227145514226599 0.26295687991560179331 -0.043064718383132631618 0.061484691709397708281 0.13924764482542678623 0.24746376820449159095 -0.099154813606309663565 0.01541930631325360776 -0.081819316153371596245 0.013891015383205767078 -0.4445317488353494606 -0.21099884866042811771 -0.16579530192091160301 -0.0049613483402690533586 0.061491431683704973754 0.68877130523127994 0.15746326732528559411 0.32030020211918308615 -0.053291363305393801841 -0.68304791154194388625 0.51489801798999879079 -0.50056363191569697157 -0.42339982507112228216 -0.65187124523900463746 -0.28201311836327558336 -0.3957665027237168287 -0.2717798445755982284 0.33587278174858742341;-0.68831101370489689018 -0.32224228184848180412 -0.77468706920930829884 0.17757708433226335187 -0.30454090436987274471 -0.37011271399070122534 0.084825987709176903229 -0.3716666956644659181 0.055159633096690439957 -0.69103006296685598464 0.026470744231685782583 0.38026672010651896283 0.039740529031487892286 -0.089844337116664618748 0.2048833416681500319 0.07677081062111611176 0.13548051986131159907 -0.087741349120093195535 0.037903165688872725303 0.21333770338218580043 -0.46863771857536556942 0.14825813793202621826 -0.037483442416419258947 -0.18642232285027174332 -0.01004365396991173387 0.046838749616197605796 -0.22048473173425237048 -0.1807741625619696535 0.25202400643345540532 -0.056412942844311822488 0.068929777581973050715 0.028842519766087166416 -0.14111567602392705023 0.062528101202442870621 0.17304299119734684043 -0.018246122406824751006 -0.088660891586091097882 0.057706182263985196512 -0.16556262072930838514 -0.14704858897525416306 -0.068445220854299812507 0.4488654007192162676 -0.50831873931439919279 0.75979758689548704265 -0.057450466803554416095 0.60468318902345463695 -0.42155844592265701021 0.44889278997325793297 0.15138929224414185426 -0.12857234358778049654];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [1.74403571741344;0.964569502683839;0.800698620563121];
y1_step1.xoffset = [0;0.208258648908721;-2.74702687782755];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end
