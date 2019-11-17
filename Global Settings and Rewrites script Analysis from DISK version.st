"####################"
"### SpectralSuite 2019 ###"
"####################"

"##################"
"## FROM DISK v 7.84###"
"### some global settings and set up scripts ###"
"##################"

|  fftSizeNorm frameLength fn head  frameStep sAndO capDur nbrPartials  dur frameCount bufferSize fftsize timax |

fftSizeNorm :=  ((?FFTSize closestPowerOfTwo truncated) vmin: 16384) vmax: 256.

frameLength := fftSizeNorm / 2.

"##### FFT from disk player #########################"
"#####  Cristian Vogel and Gustav Scholda (c)2017-2019#####"
"v7.5 for FFT from disk"

(?ChannelNumber ~= 0)
varIfTrue: [
	(((((?analysisfile asFilename displayTailWithoutFileExtension) reverse) readStream) skipThrough: $.) notNil)
	varIfTrue: [
		head := (((((?analysisfile asFilename displayTailWithoutFileExtension) reverse) readStream) skipThrough: $.) upToEnd) reverse.
		fn := head&'.'&?ChannelNumber.
	]
	ifFalse: [
		fn := ?analysisfile asFilename displayTailWithoutFileExtension.
	]
]
ifFalse: [
	fn := ?analysisfile asFilename displayTailWithoutFileExtension.
].

fftsize :=  ?fftsize.
nbrPartials:= fftsize.
dur := fn asSamplesFile sampleFrames.
frameCount := (dur removeUnits / fftsize) truncated.
capDur := frameCount.
bufferSize := frameCount * fftsize.
frameStep := (fftsize * 2) /  bufferSize.
sAndO := frameStep / 2.

(frameCount even)
varIfTrue: [
	capDur := frameCount .
	timax := 1.0.
]
ifFalse: [
	capDur := (frameCount + 1)  .
	timax := (capDur - 1) / capDur.
].

(inputs at: (?stereo varIfTrue:[2] ifFalse:[1])) 
start: 0 s 

bypassFreeze:  (?shapedFreeze varIfTrue: [ ?bypassFreeze ] ifFalse: [0] )
resetFreeze: (?shapedFreeze varIfTrue: [ ?resetFreeze ] ifFalse: [0] )
unfrozenLevel: (?shapedFreeze varIfTrue: [ ?unfrozenLevel ] ifFalse: [1] )
fullFreeze: (?shapedFreeze varIfTrue: [ ?fullFreeze ] ifFalse: [0] )
shapeToFreeze: (?shapedFreeze varIfTrue: [ ?shapeToFreeze ] ifFalse: [0] )

polysignalWaves: ?SpecEnvWaves
specEnvShape: ((?specEnvShape * ((?SpecEnvWaves sampleFileDuration samp removeUnits / 4096.0) -1) truncated))
shapeForm: ((?shapeForm * ((?shapeWaves sampleFileDuration samp removeUnits / 4096.0) -1) truncated))

fftSize: fftSizeNorm 
frameLength: frameLength
delayed: frameLength
undelayed: 0 
uniq: (Kyma randomName & Kyma randomName)
masking: (?masking into: #( { 0 @ 1} { 0.5 @ -0.5 } { 1 @ -1 } ) )
masksG: (?masking into: #( { 0 @ 1} { 0.5 @ 3 db } { 1 @ 9 db } ) )

frameStep: frameStep
sAndO: sAndO
capDur: capDur samp
nbrPartials: nbrPartials
fn: fn 
timax: timax
channelNbr: ?channelNumber
filename: ?analysisFile 