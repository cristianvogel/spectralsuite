"#####################"
"### FFT Suite 2019######"
"### v.7.7.2 dev ###########"
"#####################"
"programming and design///"
"(c) 2018-2019 Cristian Vogel"
"(p) NeverEngineLabs 2019"
"#####################"
"# made with WireFrames  #"
"#####################"


"Make sure Kyma performance preferences set to 14ms buffer size"
"For Paca you may need to set #shuffler and #stereo to false"
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
"Set module options here in the Options dictionary. Type true or false"
"/////////////////////////////////////"
| options | 
options:= Dictionary new. 

options 

add: #stereo -> true;		" Stereo or Mono"
add: #inputx -> true;		"Cross mags from 3rd input"
add: #spectralDynamics -> true;
add: #phasor -> true;
add: #phasorScope -> true;
add: #preFilters -> false;
add: #postFilters -> true;
add: #shuffler -> false;
add: #shapedFreeze -> true;
add: #spectralEnvelopes -> false;
add: #masks -> true;
add: #deranger -> true;
add: #trackDelays -> false;
add: #tonalNoise -> true;
add: #spectrogram ->true. 


(inputs at: 1) start: 0 


"\\\\\\\\\ Public Parameters \\\\\\\\\\\\\\\\\\"
"//// change stuff below this line //////////////"



fftSize: 4096 "no Capytalk!" 

"^^^^ you can use 512 / 1024 / 2048 / 4096 / 8192 / 16384 ^^^^^"
"^^^^ through and control latency is related to this frame length ^^^"
"^^^^ sound quality too! -- experiment with it ^^^^^^^^^^^^^^^^^"

shapeWaves: 'WobblyGamelan_10.wav'
specEnvWaves: 'SpectralEnvelopeWaves.wav'

source: (inputs at: 2)
sourceinputX: (inputs at: 3)
  
trackDelayMax: 100  "in Frames"
trackDelayBypass: !TrackDelaysBypass
trackDelayScale: !TrackDelayScale
trackDelaySpread: !TrackDelaySpread
shapeToTrackDelay: !ShapeToTrackDelay
trackDelayReverseRead: !trackDelayReverseRead
trackDelayMix: !trackDelayMix
shapeToTrackDelay: !ShapeToTrackDelay
trackDelayFeedback: !TrackDelayFeedback

glitchRate: !GlitchRate
glitchMags: !GlitchMags
glitchShape: !GlitchShape

pitchDerange: !PitchDerange
moreDeranged: !MoreDeranged
shapeToFormants: !ShapeToFormants

tonalNoiseBalance: !TonalNoiseBalance
noiseGain: !NoiseGain
tonalGain: !TonalGain

masking: !Masking
masksShaper: !masksShaper
masksFadeInTc: !masksFadeInTc
masksFadeOutTc: !masksFadeOutTc
masksTimeConstant: !masksTimeConstant
shapeToMasks: !ShapeToMasks

magicDustRotate: !magicDustRotate
magicDustWidth: !magicDustWidth
magicDust: !MagicDust
stereoWidth: !StereoWidth

specEnvAmmount: !SpecEnvelope
specEnvTimeConstant: !SpecEnvBPM bpm s
specEnvShape: !SpecEnvelopeShape

"in build will become type HotArray ?specEnvParams:  #( {!SpecEnv.x} {!SpecEnv.y} )"
specEnvParam1: !SpecEnv.x 
specEnvParam2: !SpecEnv.y

specEnvReset: !specEnvReset

shuffleMemory: 20 "no Capytalk!"
shuffleTimeConstant: !ShuffleSpeed bpm
shuffleAmount: !ShuffleAmount
shuffleJitter: !shuffleJitter
shuffleBypass: !ShuffleBypass

shapeBandWidth: !shapeBandWidth
shapeShift: !shapeShift
shapeScrub:!shapeScrub
shapeScale: !shapeScale
shapeOffset: (!shapeOffset * (1 ramp0: 5 s))
shapeForm: !shapeForm
shapeTilt: !ShapeTilt
shapeToFreeze: !ShapeToFreeze

frozenTracksOnly: !frozenTracksOnly
fullFreeze: !FullFreeze
subtractFreeze: !SubtractFreeze
bypassFreeze: !bypassFreeze
frozenGain: !FrozenGain db
resetfreeze: !Resetfreeze

blurTimeConstant: ((!TimeConstant smoothFor: 2 s))
spreadStartTimes: !spreadStartTimes
blurInterpolate:  !BlurInterpolate
blurReverse: !reverse
blurReset: !blurReset
shapeToBlur: !ShapeToBlur

seed: 0.23234 "no CapyTalk!"

inputLevel: !InputLevel
gain: (!Gain smooth: 1 s) db

cutHighs: !cutHighs
cutLows: !cutLows

imageRotate: !ImageRotate
imageWidth: !ImageWidth

shiftFormants: !shiftFormants
stretchFormants: !StretchFormants


phasorDensity: !phasorDensity
phasorShape: !phasorShape
phasorSync: !PhasorSync
complexPhasor: !complexPhasor
fine: !Fine
phasorModSync:!phasorModSync

shapeToDynamics: !shapeToDynamics
companderMakeUp: !companderMakeUp
limiterRelease: !limiterRelease
limiterAttack: !limiterAttack
companderCurve: !CompanderCurve
dynamics: !dynamics
companderThreshold: !CompanderThreshold



"////private parameters\\\\\\"
"////////////////////////////"
"do not change below this line"
"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

stereo: ( options at: #stereo )
spectralDynamics: ( options at: #spectralDynamics )
complexPhasorOption:  ( options at: #phasor )
phasorScopeOption: ( options at: #phasorScope )
preFiltersOption: (( options at: #postFilters ) xor:  ( options at: #preFilters ))
postFiltersOption: ( options at: #postFilters ) 
spectrogram: (options at: #spectrogram)
shuffler: (options at: #shuffler)
shapedFreeze: true "always true"
spectralEnvelopes: (options at: #spectralEnvelopes)
inputX: (options at: #inputx)
masks: (options at: #masks)
deranger: (options at: #deranger)
trackDelays: (options at: #trackDelays)
tonalNoise: (options at: #tonalNoise)