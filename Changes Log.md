## Spectral Suite
### Changes Log

Sun Nov 17 11:47:04 2019

### Working in V7.84 Dev and Build.kym

* ShapedFreeze: corrected ShapeToFreeze behavior to truly bypass all phase randomisation when not engaged
* Compander: added user defined weighting curve from wavetable
* ClassParameters: added CompanderWeighting
* ShapeProgrammer: made shapeTilt be addition not product and corrected shapeOrder to exponentiate shape not tilt [new circuit](https://www.dropbox.com/s/34ilz9jx2wjq07e/Screenshot%202019-11-17%2013.50.06.png?dl=0)
* FromDisk: Deprecated !FrameJitter circuit for efficiency. Was causing artefacts and not so useful really
* new build and dev scripts



Sat Nov 16 19:37:16 2019

### Working in V7.84 Dev and Build.kym

* ShapedFreeze: found and fixed mistake with shaped freeze thresholded phase randomisation at 'phase resynth algorithm' node
* ShapedFreeze: deprecated !FrozenTracksOnly toggle parameter field
* ShapedFreeze: made it possible to mix levels between frozen and unfrozen
* ShapedFreeze: got !ResetFreeze to work correctly and to also read latest frame when !FullFreeze is switched on
* phaseSynth: set threshold for phase randomisation to -30db lets a bit of phase movement through freezing
* ClassParameters: added !UnFrozenLevel renamed --!frozenGain-- to !FrozenLevel
* BuildOptions: re-instated #freezeShaper to boolean build options as it turns out FrameShape Progammer _can_ be running even when the freeze module is not built
* ShapedFreeze: optimised and made fullFreeze continous instead of a switch, allowing for arbitrary smooth times into and out of fullFreeze state... like a gradual thaw
* DeepBlur: made it so that !blurReset momentarily resets the blurTc so it captures new frame mid-blur
* TrackDelays: fixed a 3db drop after TrackDelays module