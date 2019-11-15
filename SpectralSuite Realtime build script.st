"#####################"
"### Spectral Suite 2019######"
"### RT v.7.8 ###########"
"#####################"
"programming and design///"
"(c) 2018-2019 Cristian Vogel"
"(p) NeverEngineLabs 2019"
"#####################"
"# made with WireFrames  #"
"#####################"



| optionsArray r keys options  | 

options := Dictionary new.
optionsArray := ?BuildOptions.
keys := ( optionsArray select: [:el | el class = ByteSymbol]).  
(keys isNil) ifFalse: [

keys do: [:k | 

r:= optionsArray indexOf: k. 

(r+1 <= optionsArray size) 
ifTrue: [

	( ((optionsArray at: r+1) class ~= True) & ((optionsArray at: r+1) class ~= False)  ) ifTrue: [

 self informUser: 'Build options should be followed by true or false for example: #stereo true #masks false'. self abortForKyma. 

].

	options add: ((optionsArray at: r) -> (optionsArray at: r+1))
] 
ifFalse: [ self informUser: ( 'Error: Data missing after #'&k). self abortForKyma. ].
]
] ifTrue: [ self informUser: ( 'Option keys must start with #... for example: #stereo true #prefilters false etc'). self abortForKyma.  ].

?enable varIfTrue: [
(inputs at: 1) 
start: 0 
fftsize: ?fftsize

source: ?source
sourceinputX: ?sourceinputX

trackDelayMax: ?trackDelayMax
trackDelayBypass: ?TrackDelaysBypass
trackDelayScale: ?TrackDelayScale
trackDelaySpread: ?TrackDelaySpread
trackDelayFeedback: ?trackDelayFeedback
trackDelayReverseRead: ?trackDelayReverseRead
trackDelayMix: ?trackDelayMix
shapeToTrackDelay: ?ShapeToTrackDelay

glitchRate: ?GlitchRate
glitchMags: ?GlitchMags
glitchShape: ?GlitchShape

pitchDerange: ?PitchDerange
moreDeranged: ?MoreDeranged
shapeToFormants: ?ShapeToFormants

tonalNoiseBalance: ?TonalNoiseBalance
noiseGain: ?NoiseGain
tonalGain: ?TonalGain


masking: ?Masking
masksShaper: ?masksShaper
masksFadeInTc: ?masksFadeInTc
masksFadeOutTc: ?masksFadeOutTc
masksTimeConstant: ?masksTimeConstant
shapeToMasks: ?ShapeToMasks

magicDustRotate: ?magicDustRotate
magicDustWidth: ?magicDustWidth
magicDust: ?MagicDust

specEnvWaves: ?specEnvWaves
specEnvAmmount: ?SpecEnvelope
specEnvTimeConstant: ?SpecEnvBPM 
specEnvShape: ?SpecEnvelopeShape
specEnvParam1: (?SpecEnvParams at: 1)
specEnvParam2: (?SpecEnvParams at: 2)
specEnvReset: ?specEnvReset

shuffleMemory: ?shuffleMemory
shuffleTimeConstant: ?ShuffleSpeed bpm
shuffleAmount: ?ShuffleAmount
shuffleJitter: ?shuffleJitter
shuffleBypass: ?ShuffleBypass

shapeOrder: ?shapeOrder
shapeWaves: ?shapeWaves
shapeBandWidth: ?shapeBandWidth
shapeToFreeze: ?ShapeToFreeze
shapeShift: ?shapeShift
shapeScrub:?shapeScrub
shapeScale: ?shapeScale
shapeOffset: ?shapeOffset
shapeForm: ?shapeForm
shapeTilt: ?ShapeTilt

frozenTracksOnly: ?frozenTracksOnly
fullFreeze: ?FullFreeze
subtractFreeze: ?SubtractFreeze
bypassFreeze: ?bypassFreeze
frozenGain: ?FrozenGain 
resetFreeze: ?ResetFreeze

blurTimeConstant: ?blurTimeConstant

spreadStartTimes: ?spreadStartTimes
blurInterpolate: ?BlurInterpolate
blurReverse: ?blurreverse
blurReset: ?blurReset
shapeToBlur: ?ShapeToBlur

seed: ?seed

inputLevel: ?InputLevel
gain: ?gain
stereoWidth: ?StereoWidth

cutHighs: ?cutHighs
cutLows: ?cutLows

shiftFormants: ?shiftFormants
stretchFormants: ?StretchFormants

phasorDensity: ?phasorDensity
phasorShape: ?phasorShape
complexPhasor: ?complexPhasor
fine: ?PhasorFine
phasorModSync:?phasorModSync


shapeToDynamics: ?shapeToDynamics
companderMakeUp: ?companderMakeUp
limiterRelease: ?limiterRelease
limiterAttack: ?limiterAttack
companderCurve: ?CompanderCurve
dynamics: ?dynamics
companderThreshold: ?CompanderThreshold


"////private parameters\\\\\\"
"////////////////////////////"
"do not change below this line"
"?????????????????????????????????????????????????"

stereo: ( options at: #stereo )
spectralDynamics: ( options at: #spectralDynamics )
complexPhasorOption:  ( options at: #phasor )
phasorScopeOption: ( options at: #phasorScope )
preFiltersOption: (( options at: #postFilters ) xor:  ( options at: #preFilters ))
postFiltersOption: ( options at: #postFilters ) 
spectrogram: (options at: #spectrogram)
shuffler: (options at: #shuffler)
shapedFreeze: true
spectralEnvelopes: (options at: #spectralEnvelopes)
inputX: (options at: #inputx)
masks: (options at: #masks)
deranger: (options at: #deranger)
tonalNoise: (options at: #tonalNoise)
trackDelays: (options at: #trackDelays)
]

ifFalse: [

"\\\\\\\\\ blindfolded Class build Parameters \\\\\"

(inputs at: 1)

fftsize: ?fftsize
source: ?source
sourceinputX: ?sourceinputX

trackDelayMax: ?trackDelayMax
trackDelayBypass: ?TrackDelaysBypass
trackDelayScale: ?TrackDelayScale
trackDelaySpread: ?TrackDelaySpread
trackDelayFeedback: ?trackDelayFeedback
trackDelayReverseRead: ?trackDelayReverseRead
trackDelayMix: ?trackDelayMix
shapeToTrackDelay: ?ShapeToTrackDelay

glitchRate: ?GlitchRate
glitchMags: ?GlitchMags
glitchShape: ?GlitchShape

pitchDerange: ?PitchDerange
moreDeranged: ?MoreDeranged
shapeToFormants: ?ShapeToFormants

tonalNoiseBalance: ?TonalNoiseBalance
noiseGain: ?NoiseGain
tonalGain: ?TonalGain


masking: ?Masking
masksShaper: ?masksShaper
masksFadeInTc: ?masksFadeInTc
masksFadeOutTc: ?masksFadeOutTc
masksTimeConstant: ?masksTimeConstant
shapeToMasks: ?ShapeToMasks

magicDustRotate: ?magicDustRotate
magicDustWidth: ?magicDustWidth
magicDust: ?MagicDust


specEnvAmmount: ?SpecEnvelope
specEnvTimeConstant: ?SpecEnvBPM 
specEnvShape: ?SpecEnvelopeShape
specEnvParam1: (?SpecEnvParams at: 1)
specEnvParam2: (?SpecEnvParams at: 2)
specEnvReset: ?specEnvReset

shuffleMemory: ?shuffleMemory
shuffleTimeConstant: ?ShuffleSpeed bpm
shuffleAmount: ?ShuffleAmount
shuffleJitter: ?shuffleJitter
shuffleBypass: ?ShuffleBypass

shapeOrder: ?shapeOrder
shapeWaves: ?shapeWaves
shapeBandWidth: ?shapeBandWidth
shapeToFreeze: ?ShapeToFreeze
shapeShift: ?shapeShift
shapeScrub:?shapeScrub
shapeScale: ?shapeScale
shapeOffset: ?shapeOffset
shapeForm: ?shapeForm
shapeTilt: ?ShapeTilt

frozenTracksOnly: ?frozenTracksOnly
fullFreeze: ?FullFreeze
subtractFreeze: ?SubtractFreeze
bypassFreeze: ?bypassFreeze
frozenGain: ?FrozenGain 
resetFreeze: ?ResetFreeze

blurTimeConstant: ?blurTimeConstant

spreadStartTimes: ?spreadStartTimes
blurInterpolate: ?BlurInterpolate
blurReverse: ?blurreverse
blurReset: ?blurReset
shapeToBlur: ?ShapeToBlur

seed: ?seed

inputLevel: ?InputLevel
gain: ?gain
stereoWidth: ?StereoWidth

cutHighs: ?cutHighs
cutLows: ?cutLows

shiftFormants: ?shiftFormants
stretchFormants: ?StretchFormants

phasorDensity: ?phasorDensity
phasorShape: ?phasorShape
complexPhasor: ?complexPhasor
fine: ?PhasorFine
phasorModSync:?phasorModSync

shapeToDynamics: ?shapeToDynamics
companderMakeUp: ?companderMakeUp
limiterRelease: ?limiterRelease
limiterAttack: ?limiterAttack
companderCurve: ?CompanderCurve
dynamics: ?dynamics
companderThreshold: ?CompanderThreshold

stereo: true
spectralDynamics: true
complexPhasorOption:  true
phasorScopeOption: true
preFiltersOption: true
postFiltersOption: true
spectrogram: true
shuffler: true
shapedFreeze: true
spectralEnvelopes: true
inputX: true
masks: true
deranger: true
tonalNoise: true
trackDelays: true

]