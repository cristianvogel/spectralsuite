"#####################"
"### Spectral Suite 2019######"
"### RT v.7.84 ###########"
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

?Enable varIfTrue: [
(inputs at: 1) 

start: 0 

blurInterpolate: ?blurInterpolate
blurReset: ?blurReset
blurReverse: ?blurreverse
blurTimeConstant: ?blurTimeConstant
bypassFreeze: ?bypassFreeze
companderCurve: ?companderCurve
companderMakeUp: ?companderMakeUp
companderThreshold: ?companderThreshold
companderWeighting: ?CompanderWeighting
complexPhasor: ?complexPhasor
cutHighs: ?cutHighs
cutLows: ?cutLows
dynamics: ?dynamics
fftsize: ?fftsize
fine: ?phasorFine
frozenLevel: ?frozenLevel
fullFreeze: ?fullFreeze
gain: ?gain
glitchMags: ?glitchMags
glitchRate: ?glitchRate
glitchShape: ?glitchShape
inputLevel: ?inputLevel
limiterAttack: ?limiterAttack
limiterRelease: ?limiterRelease
magicDust: ?magicDust
magicDustRotate: ?magicDustRotate
magicDustWidth: ?magicDustWidth
masking: ?masking
masksFadeInTc: ?masksFadeInTc
masksFadeOutTc: ?masksFadeOutTc
masksShaper: ?masksShaper
masksTimeConstant: ?masksTimeConstant
moreDeranged: ?moreDeranged
noiseGain: ?noiseGain
phasorDensity: ?phasorDensity
phasorModSync:?phasorModSync
phasorShape: ?phasorShape
pitchDerange: ?pitchDerange
resetFreeze: ?resetFreeze
seed: ?seed
shapeBandWidth: ?shapeBandWidth
shapeForm: ?shapeForm
shapeOffset: ?shapeOffset
shapeOrder: ?shapeOrder
shapeScale: ?shapeScale
shapeScrub:?shapeScrub
shapeShift: ?shapeShift
shapeTilt: ?shapeTilt
shapeToBlur: ?shapeToBlur
shapeToDynamics: ?shapeToDynamics
shapeToFormants: ?ShapeToFormants
shapeToFreeze: ?shapeToFreeze
shapeToMasks: ?shapeToMasks
shapeToTrackDelay: ?shapeToTrackDelay
shapeWaves: ?ShapeWaves
shiftFormants: ?shiftFormants
shuffleAmount: ?shuffleAmount
shuffleBypass: ?shuffleBypass
shuffleJitter: ?shuffleJitter
shuffleMemory: ?shuffleMemory
shuffleTimeConstant: ?shuffleSpeed bpm
source: ?Source
sourceinputX: ?SourceInputX
specEnvAmmount: ?specEnvelope
specEnvParam1: (?SpecEnvParams at: 1)
specEnvParam2: (?SpecEnvParams at: 2)
specEnvReset: ?specEnvReset
specEnvShape: ?specEnvelopeShape
specEnvTimeConstant: ?specEnvBPM 
specEnvWaves: ?SpecEnvWaves
spreadStartTimes: ?spreadStartTimes
stereoWidth: ?stereoWidth
stretchFormants: ?stretchFormants
subtractFreeze: ?subtractFreeze
tonalGain: ?tonalGain
tonalNoiseBalance: ?tonalNoiseBalance
trackDelayBypass: ?trackDelaysBypass
trackDelayFeedback: ?trackDelayFeedback
trackDelayMax: ?trackDelayMax
trackDelayMix: ?trackDelayMix
trackDelayReverseRead: ?trackDelayReverseRead
trackDelayScale: ?trackDelayScale
trackDelaySpread: ?trackDelaySpread
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
shuffler: (options at: #shuffler)
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

blurInterpolate: ?blurInterpolate
blurReset: ?blurReset
blurReverse: ?blurreverse
blurTimeConstant: ?blurTimeConstant
bypassFreeze: ?bypassFreeze
companderCurve: ?companderCurve
companderMakeUp: ?companderMakeUp
companderThreshold: ?companderThreshold
companderWeighting: ?CompanderWeighting
complexPhasor: ?complexPhasor
cutHighs: ?cutHighs
cutLows: ?cutLows
dynamics: ?dynamics
fftsize: ?fftsize
fine: ?phasorFine
frozenLevel: ?frozenLevel
fullFreeze: ?fullFreeze
gain: ?gain
glitchMags: ?glitchMags
glitchRate: ?glitchRate
glitchShape: ?glitchShape
inputLevel: ?inputLevel
limiterAttack: ?limiterAttack
limiterRelease: ?limiterRelease
magicDust: ?magicDust
magicDustRotate: ?magicDustRotate
magicDustWidth: ?magicDustWidth
masking: ?masking
masksFadeInTc: ?masksFadeInTc
masksFadeOutTc: ?masksFadeOutTc
masksShaper: ?masksShaper
masksTimeConstant: ?masksTimeConstant
moreDeranged: ?moreDeranged
noiseGain: ?noiseGain
phasorDensity: ?phasorDensity
phasorModSync:?phasorModSync
phasorShape: ?phasorShape
pitchDerange: ?pitchDerange
resetFreeze: ?resetFreeze
seed: ?seed
shapeBandWidth: ?shapeBandWidth
shapeForm: ?shapeForm
shapeOffset: ?shapeOffset
shapeOrder: ?shapeOrder
shapeScale: ?shapeScale
shapeScrub:?shapeScrub
shapeShift: ?shapeShift
shapeTilt: ?shapeTilt
shapeToBlur: ?shapeToBlur
shapeToDynamics: ?shapeToDynamics
shapeToFormants: ?ShapeToFormants
shapeToFreeze: ?shapeToFreeze
shapeToMasks: ?shapeToMasks
shapeToTrackDelay: ?shapeToTrackDelay
shapeWaves: ?ShapeWaves
shiftFormants: ?shiftFormants
shuffleAmount: ?shuffleAmount
shuffleBypass: ?shuffleBypass
shuffleJitter: ?shuffleJitter
shuffleMemory: ?shuffleMemory
shuffleTimeConstant: ?shuffleSpeed bpm
source: ?Source
sourceinputX: ?SourceInputX
specEnvAmmount: ?specEnvelope
specEnvParam1: (?SpecEnvParams at: 1)
specEnvParam2: (?SpecEnvParams at: 2)
specEnvReset: ?specEnvReset
specEnvShape: ?specEnvelopeShape
specEnvTimeConstant: ?specEnvBPM 
specEnvWaves: ?SpecEnvWaves
spreadStartTimes: ?spreadStartTimes
stereoWidth: ?stereoWidth
stretchFormants: ?stretchFormants
subtractFreeze: ?subtractFreeze
tonalGain: ?tonalGain
tonalNoiseBalance: ?tonalNoiseBalance
trackDelayBypass: ?trackDelaysBypass
trackDelayFeedback: ?trackDelayFeedback
trackDelayMax: ?trackDelayMax
trackDelayMix: ?trackDelayMix
trackDelayReverseRead: ?trackDelayReverseRead
trackDelayScale: ?trackDelayScale
trackDelaySpread: ?trackDelaySpread
unfrozenLevel: ?unfrozenLevel

complexPhasorOption:  true
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