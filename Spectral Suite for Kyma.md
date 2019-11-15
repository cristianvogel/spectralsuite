# Spectral Suite for Kyma
## Development Story

Development started on the Spectral Suite in late 2017 by myself - Cristian Vogel - and fellow NeverEngineer Gustav Scholda. Gustav left the project in mid 2018 to work on C development of his own algorithms. I continued designing and developing the spectral processors entirely in Kyma through 2018/2019. 

The following pages document some of the development challenges and solutions achieved. 

Many thanks to Gustav Scholda, SØS Gunver Ryberg, Symbolic Sound, Will Klingenmeier, Anders Skibsted for their invaluable support and encouragement throughout this long process. 


# Milestones and Breakthroughs

## Magic Dust Phase Synthesis Algorithm
Gustav has always preferred full randomisation of phase data in order to get artefact free resynthesis. I wanted to pursue a hybrid version that could keep original phase information intact, especially for maintaining a useable stereo image. I find that de-correlated phase randomisation is too diffuse and the stereo image contains little mid information and a lot of side.

My approach was to develop a multichannel phase randomisation noise core, that synthesises a stereo noise spectrum with frequency related spatial information. It is mono from DC and begins to up the de-correlation between channels like a funnel, so that the width is is more natural sounding. This can be tuned. The spatial 'funnel' also has some kind of 'ripples' or 'twists' , so that we don't  get a linear widening funnel, but instead a spatial form that ripples between monophonic and de-correlated phase information as it widens upwards through the frequency spectrum. The frequency focus of these 'ripples' can be adjusted by the user to locate where the mono information maps best onto the source material.

Furthermore, complete phases randomisation synthesis is not a compulsory choice. The user can blend between 'Extracted' phase data, a glitchy phase synthesis and full randomisation the so-called 'Magic Dust'.  

The 'Extracted' mode is working with as much original or modified from the original analysed phase information as possible.  It might display some artefacts as phase data is not being interpolated over frames ( see *Rabbit Hole Time Suckers* below)  - but generally in Kyma we get a good result reading analysed phase information, once the correct frame synchronisation between processed magnitude and phase frames has been found.  

In between 'Extracted' and 'Magic Dust' is an area where the phase information is not random enough and there are clear glitches in the resynthesis. This could be sometimes desirable for the sound designer, so it was emphasised with a downsampled parameterised noise signal added to the phase frames. This noise signal can also be routed to the magnitude frames, making a  designed glitch style for the phase resynthesis. 

'Magic Dust' is all out phase randomisation, applying the 'funnel' spatial noise core described above to control the width up through the frequency spectrum. 

Furthermore, some of the processors only apply phase randomisation when needed. This is particularly the case in the Shaped Freeze module, which will only randomise the phases on Tracks whose magnitudes are being partially or fully frozen whilst leaving unfrozen tracks to pass through.

## Frame Shape Programmer

A further innovation was the Frame Shape Programmer. It addresses the challenge of how to allow for parametric control of each individual Track [^1] from each frame of frequency domain data in realtime. The user is effectively controlling the parameters of 4096 or 8192 or even 16384 individual data tracks at the same time. What is the best way to navigate such a dense parameter space? It is obvious that single parameter controllers, such as faders and dials are no longer viable.

In the Spectral Suite,  each Track of frame data can be modified using a technique we introduced in our WireFrames library - * Frame Shaping*. What this means is that all the data in a  single Frame  can be scaled, offset or thresholded by a secondary time-domain signal, an oscillator whose single-cycle period matches that of the Frame data. What this  means is that each point in the "Shaper" signal can then be made to act on each Track in the spectral data. We achieved this by ensuring the "Shaper" oscillator fits to the Frame period and to a sonically interesting parameter modification, throughout the entire spectral suite. 

 The  waveform of the "Shaper" oscillator can be continuously modified by the user whilst never losing that synchronisation. Kyma is remarkably reliable at sample accurate synchronisation, that is why this works.  

Using only one Frame Shape Programmer, the user can then route a morphable shape to control the parameters of different modules in the suite. Sending the Shape to scale the Freeze module will sculpt how frozen each Track will be. For example, if the sample point at the index of 8 in the Frame Shaper waveform has a value of 1 then the 8th bin of the analysis data will be completely frozen. A sample value of 0.9  in the Frame Shaper would almost completely freeze, some thawing would occur. This happens with a complex of Shape of thousands of parameters at once, resulting in an intuitive way to program many thousands of parameters at once. 

It is worth noting here, that in a Spectrum, the audible magnitudes that we hear most are almost always in the first 100 Tracks. That is the lower end of the spectrum where most of the spectral energy is concentrated in normal acoustic sound. Therefore, the Frame Shaping works most noticeably down there. The user might want to zoom in the FrameScope which visualises the Frame data, in order to get a better understanding between what they hear and what they are shaping.

## Optional Build in Single Class
Figured out a way to script optional build options. This is to enable a user to work with only a few of the modules, introducing a modularity without needing to chain FFT/iFFT blocks in series. The FFT only needs to be done once then, and all processing happens on the frequency domain sample data. This has meant I can squeeze a significant amount of spectral processing in stereo without running out of realtime.  It also enables Paca users to join the party, as the efficiency can be tuned for their system. 

It also enabled me as developer to  design and optimise and test everything from only one build, reducing the margin for mistakes and painstaking debugging.  Virtual Control UI design is also much easier to manage.

## Frame Blending Algorithm
Rendering FFT analysis to disk was difficult. Everything depends on making sure that written data is a multiple of FFT size samples. On the playback side, I invented a number of different approaches to frame blending in lieu of not being to calculate a running phase during rate change. I finally settled for a 2D approach, where a user can tune the frame blending depending on whether they want a lot of blending, which can diffuse all transients, or allow some transients and some level of artefacts. This can be used creatively. 




# Rabbit Holes and Time Suckers

### PhaseVocoder Model

We failed to find a good way to build a running phase integrator in realtime Kyma style frame-based signal based programming. We tried various approaches to get a running phase, such as pseudo differentiation and integration using single sample and frame size feedback delay lines with Add Wrap mixing and derivative signal wrapping. This took up months of trial and error. 

The main problem was finding a way to clear the integrator feedback, once the phase information had been dirtied or randomised. The best attempt was with dual integrator buffers, one which was always clean and one always dirty and switching between them. But this introduced other artefacts on the way, some kind of 'frequency zipper' sound rather like running a pencil on a spring perhaps coming from the lag introduced by the necessary delays for derivative and integrator in realtime. 


### 4xOverlap

Kyma FFT is 2x overlap by default. We tried to develop a 4x overlap but realised that there is no way around having to build the entire signal graph 4 times to achieve that, which became incredibly inefficient. Symbolic Sound looked into making the prototype 4x or 8x compatible from their side, but concluded that there was no gain in efficiency.  So we are stuck with 2x overlap.





[^1]:	This is what FFT analysis bins are called in Kyma. The terms Track and Bin are used interchangeably in this document