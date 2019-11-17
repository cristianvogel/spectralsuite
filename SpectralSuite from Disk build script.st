"#####################"
"### Spectral Suite 2019######"
"### From Disk v.7.84 ###########"
"#####################"
"programming and design///"
"(c) 2018-2019 Cristian Vogel"
"(p) NeverEngineLabs 2019"
"#####################"
"# made with WireFrames  #"
"#####################"


"remember to remove scopes before build"


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

analysisFile: ?analysisFile
blurInterpolate: ?BlurInterpolate
blurReset: ?blurReset
blurReverse: ?blurreverse
blurTimeConstant: ?blurTimeConstant
bypassFreeze: ?bypassFreeze
companderCurve: ?CompanderCurve
companderMakeUp: ?companderMakeUp
companderThreshold: ?CompanderThreshold
companderWeighting: ?companderWeighting
complexPhasor: ?complexPhasor
cutHighs: ?cutHighs
cutLows: ?cutLows
dynamics: ?dynamics
fftsize: ?fftsize
fine: ?PhasorFine
frameBlend: ?FrameBlend
frozenLevel: ?frozenLevel
fullFreeze: ?FullFreeze
gain: ?gain
glitchMags: ?GlitchMags
glitchRate: ?GlitchRate
glitchShape: ?GlitchShape
inputLevel: ?InputLevel
limiterAttack: ?limiterAttack
limiterRelease: ?limiterRelease
magicDust: ?MagicDust
magicDustRotate: ?magicDustRotate
magicDustWidth: ?magicDustWidth
masking: ?Masking
masksFadeInTc: ?masksFadeInTc
masksFadeOutTc: ?masksFadeOutTc
masksShaper: ?masksShaper
masksTimeConstant: ?masksTimeConstant
moreDeranged: ?MoreDeranged
noiseGain: ?NoiseGain
phasorDensity: ?phasorDensity
phasorModSync:?phasorModSync
phasorShape: ?phasorShape
pitchDerange: ?PitchDerange
resetFreeze: ?ResetFreeze
seed: ?seed
shapeBandWidth: ?shapeBandWidth
shapeForm: ?shapeForm
shapeOffset: ?shapeOffset
shapeOrder: ?shapeOrder
shapeScale: ?shapeScale
shapeScrub:?shapeScrub
shapeShift: ?shapeShift
shapeTilt: ?ShapeTilt
shapeToBlur: ?ShapeToBlur
shapeToDynamics: ?shapeToDynamics
shapeToFormants: ?ShapeToFormants
shapeToFreeze: ?ShapeToFreeze
shapeToMasks: ?ShapeToMasks
shapeToTrackDelay: ?ShapeToTrackDelay
shapeWaves: ?shapeWaves
shapeWaves: ?shapeWaves
shiftFormants: ?shiftFormants
sourceinputX: ?sourceinputX
specEnvAmmount: ?SpecEnvelope
specEnvParam1: (?SpecEnvParams at: 1)
specEnvParam2: (?SpecEnvParams at: 2)
specEnvReset: ?specEnvReset
specEnvShape: ?SpecEnvelopeShape
specEnvTimeConstant: ?SpecEnvBPM 
specEnvWaves: ?specEnvWaves
specEnvWaves: ?specEnvWaves
spreadStartTimes: ?spreadStartTimes
stereoWidth: ?StereoWidth
stretchFormants: ?StretchFormants
subtractFreeze: ?SubtractFreeze
timeindex: ?timeindex
tonalGain: ?TonalGain
tonalNoiseBalance: ?TonalNoiseBalance
trackDelayBypass: ?TrackDelaysBypass
trackDelayFeedback: ?trackDelayFeedback
trackDelayMax: ?trackDelayMax
trackDelayMix: ?trackDelayMix
trackDelayReverseRead: ?trackDelayReverseRead
trackDelayScale: ?TrackDelayScale
trackDelaySpread: ?TrackDelaySpread
unfrozenLevel: ?unfrozenLevel


"////private parameters\\\\\\"
"////////////////////////////"
"do not change below this line"
"?????????????????????????????????????????????????"

complexPhasorOption:  ( options at: #phasor )
deranger: (options at: #deranger)
inputX: (options at: #inputx)
masks: (options at: #masks)
phasorScopeOption: ( options at: #phasorScope )
postFiltersOption: ( options at: #postFilters ) 
preFiltersOption: (( options at: #postFilters ) xor:  ( options at: #preFilters ))
shapedFreeze: (options at: #shapedFreeze)
shuffler: true
spectralDynamics: ( options at: #spectralDynamics )
spectralEnvelopes: (options at: #spectralEnvelopes)
spectrogram: (options at: #spectrogram)
stereo: ( options at: #stereo )
tonalNoise: (options at: #tonalNoise)
trackDelays: (options at: #trackDelays)
]

ifFalse: [

"\\\\\\\\\ blindfolded Class build Parameters \\\\\"

(inputs at: 1)

analysisFile: ?analysisFile
blurInterpolate: ?BlurInterpolate
blurReset: ?blurReset
blurReverse: ?blurreverse
blurTimeConstant: ?blurTimeConstant
bypassFreeze: ?bypassFreeze
companderCurve: ?CompanderCurve
companderMakeUp: ?companderMakeUp
companderThreshold: ?CompanderThreshold
companderWeighting: ?companderWeighting
complexPhasor: ?complexPhasor
cutHighs: ?cutHighs
cutLows: ?cutLows
dynamics: ?dynamics
fftsize: ?fftsize
fine: ?PhasorFine
frameBlend: ?FrameBlend
frozenLevel: ?frozenLevel
fullFreeze: ?FullFreeze
gain: ?gain
glitchMags: ?GlitchMags
glitchRate: ?GlitchRate
glitchShape: ?GlitchShape
inputLevel: ?InputLevel
limiterAttack: ?limiterAttack
limiterRelease: ?limiterRelease
magicDust: ?MagicDust
magicDustRotate: ?magicDustRotate
magicDustWidth: ?magicDustWidth
masking: ?Masking
masksFadeInTc: ?masksFadeInTc
masksFadeOutTc: ?masksFadeOutTc
masksShaper: ?masksShaper
masksTimeConstant: ?masksTimeConstant
moreDeranged: ?MoreDeranged
noiseGain: ?NoiseGain
phasorDensity: ?phasorDensity
phasorModSync:?phasorModSync
phasorShape: ?phasorShape
pitchDerange: ?PitchDerange
resetFreeze: ?ResetFreeze
seed: ?seed
shapeBandWidth: ?shapeBandWidth
shapeForm: ?shapeForm
shapeOffset: ?shapeOffset
shapeOrder: ?shapeOrder
shapeScale: ?shapeScale
shapeScrub:?shapeScrub
shapeShift: ?shapeShift
shapeTilt: ?ShapeTilt
shapeToBlur: ?ShapeToBlur
shapeToDynamics: ?shapeToDynamics
shapeToFormants: ?ShapeToFormants
shapeToFreeze: ?ShapeToFreeze
shapeToMasks: ?ShapeToMasks
shapeToTrackDelay: ?ShapeToTrackDelay
shapeWaves: ?shapeWaves
shiftFormants: ?shiftFormants
sourceinputX: ?sourceinputX
specEnvAmmount: ?SpecEnvelope
specEnvParam1: (?SpecEnvParams at: 1)
specEnvParam2: (?SpecEnvParams at: 2)
specEnvReset: ?specEnvReset
specEnvShape: ?SpecEnvelopeShape
specEnvTimeConstant: ?SpecEnvBPM 
specEnvWaves: ?specEnvWaves
specEnvWaves: ?specEnvWaves
spreadStartTimes: ?spreadStartTimes
stereoWidth: ?StereoWidth
stretchFormants: ?StretchFormants
subtractFreeze: ?SubtractFreeze
timeindex: ?timeindex
tonalGain: ?TonalGain
tonalNoiseBalance: ?TonalNoiseBalance
trackDelayBypass: ?TrackDelaysBypass
trackDelayFeedback: ?trackDelayFeedback
trackDelayMax: ?trackDelayMax
trackDelayReverseRead: ?trackDelayReverseRead
trackDelayScale: ?TrackDelayScale
trackDelaySpread: ?TrackDelaySpread
unfrozenLevel: ?unfrozenLevel

complexPhasorOption: true
deranger: true
inputX: true
masks: true
phasorScopeOption: true
postFiltersOption: true
preFiltersOption: true
shapedFreeze: true
shuffler: true
spectralDynamics: true
spectralEnvelopes: true
spectrogram: true
stereo: true
tonalNoise: true
trackDelays: true

]