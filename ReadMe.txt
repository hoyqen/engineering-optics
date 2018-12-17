Cross section of the geometry of a diffraction grating, a common
illustration in textbooks of optics, spectroscopy, and analytical chemistry.
Sliders on the figures allow real-time interactive control of the incidence angle,
grating ruling density (lines/mm), wavelength, and diffraction order.
 Tom O'Haver, toh@umd.edu, July 2006.   Slider function by Matthew Jones.

GratingMono.m
 Diffraction grating geometry with monochromatic light, orders +4 to -4 shown.
The grating surface is at the bottom of the diagram, along the x axis.
 The line labeled "Incident beam" is the direction of the incoming
 light beam.  The line labeled "0" is the direction of the zeroth-order 
 diffraction.  The upper left slider controls the angle of incidence,
 the lower left slider controls the grating ruling density (lines/mm),
 and the lower right slider controls the wavelength of the
 incident beam.

GratingOrder.m
 Diffraction grating with monochromatic incident beam, with a single selected 
 order shown.  The grating surface is at the bottom of the diagram, along the
 x axis. The line labeled "Incident beam" is the direction of the incoming
 light beam.  The dotted line is the diffracted (outgoing) beam. The line  
 labeled "Order 0" is the direction of the zeroth-order diffraction.   
 The upper left slider controls the angle of incidence, the lower 
 left slider controls the grating ruling density (lines/mm),
 the upper right slider controls the order, and the lower right
 slider controls the wavelength of the incident beam.

GratingWhite.m
Diffraction grating geometry, showing overlap of orders +1 and +2.
The grating surface is at the bottom of the diagram, along the x axis.
 The line labeled "Incident beam" is the direction of the incoming polychromatic 
 light beam. The colored lines are diffracted beams of the 7 wavelengths defined 
 in lines 30-36. (Second-order diffraction lines are drawn as shorter lines).
 The line labeled "Zero order" is the direction of  the zeroth-order 
 diffraction, at the angle of specular reflection from the grating 
 surface.  The slider on the left controls the angle of incidence and
 the slider on the right controls the grating ruling density (lines/mm).

Interference.m
 Interactive simulation of a diffraction grating spectrum.
 A diffraction grating with N grooves is illuminated by monochromatic light. 
 When viewed at an angle, the reflections from each groove are slightly 
 phase shifted by small path length differences .  When these reflections
 are all added up, a diffraction pattern emerges that shows intensity maxima
 whenever the path length difference (pld) is an integral number of wavelengths 
 (called the "order"), thereby resulting in constructive interference. If
 the number of grooves (N)  is large anough, these maxima are very sharp and
 the intensity is nearly zero everywhere else.
 Sliders on the graph allow you to adjust the path length difference (pld) 
 between adjacent grooves and the number of grooves (N).
 Calls Interference1 and Interference2 as functions when sliders are
 adjusted.

DiffractionGratingSpectrum.m
Self-running simulation of a diffraction grating spectrum
by addition of sinewaves from the superimposition of 
reflections from multiple grooves, with phase shift due to incremental 
path length difference between waves from the adjacent grooves.
Shows build-up of resultant diffraction pattern as superimposed waves 
are added with difference path length differences.  
Tom O'Haver, toh@umd.edu, March 2006

DiffractionGratingFirstOrder.m
Close-up of first-order diffraction pattern of grating illuminated by
monochromatic light.  Shows the "diffraction limit' caused by the finite
number of grooves, N.  The larger N, the narrower this pattern, and the
higher the diffraction-limited resolution of the grating.  