"####################"
"### SpectralSuite 2019 RT v7.71 ###"
"####################"

"##################"
"### Global Settings and reWrites ###"
"##################"

|  fftSizeNorm frameLength |

fftSizeNorm :=  ((?FFTSize closestPowerOfTwo truncated) vmin: 16384) vmax: 256.

frameLength := fftSizeNorm / 2.

"self debug: (  ((?shapeWaves sampleFileDuration samp removeUnits / 4096.0) -1) truncated)."

(inputs at: (?stereo varIfTrue:[2] ifFalse:[1])) 
start: 0 s 
shapeForm: ((?shapeForm * ((?shapeWaves sampleFileDuration samp removeUnits / 4096.0) -1) truncated))
fftSize: fftSizeNorm 
frameLength: frameLength
delayed: frameLength
undelayed: 0 
uniq: (Kyma randomName & Kyma randomName)
masking: (?masking into: #( { 0 @ 1} { 0.5 @ -0.5 } { 1 @ -1 } ) )
masksG: (?masking into: #( { 0 @ 1} { 0.5 @ 3 db } { 1 @ 9 db } ) )
shapeToFreeze: (?shapeToFreeze \/ ?frozenTracksOnly)