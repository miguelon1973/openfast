'''
This is the main python script that calls inflowWind (IFW) for testing

'''

# Import modules
import os
import numpy as np
from ctypes import (
	CDLL,
	POINTER,
	pointer,
	c_bool,
	c_char,
	c_char_p,
    c_wchar_p, 
	c_int,
	c_float,
	c_double,
	c_longdouble,
	create_string_buffer,
	byref,
	get_errno,
	sizeof
)
# import IFW_Types # need to create IFW_Types.py because it needs this to initialize/define the weird custom IFW data types --> goes into name_C.argtypes ...???

# Run inflow wind - via the stand-alone driver
# os.system("inflowwind_driver -tsteps[10] IFW.dvr")
# calls IEA-15-240-RWT-UMaineSemi_InflowFile.dat input file
# outputs data in file named "IFW.WindGrid.out" 

# Test python string arrays
test = np.chararray((3,20))
test= ['Test 1','Different test 2','Same test 3']
print(test[0])
print(test[1])
print(test[2])
print(len(test))

# The REAL thing
ifw_input_string = np.chararray((55,180))
ifw_input_string = ([
            '------- InflowWind v3.01.* INPUT FILE -------------------------------------------------------------------------                                                                    ', 
            'Steady 15 m/s winds with no shear for IEA 15 MW Offshore Reference Turbine                                                                                                         ', 
            '---------------------------------------------------------------------------------------------------------------                                                                    ', 
            '       false  Echo           - Echo input data to <RootName>.ech (flag)                                                                                                            ', 
            '          1   WindType       - switch for wind file type (1=steady; 2=uniform; 3=binary TurbSim FF; 4=binary Bladed-style FF; 5=HAWC format; 6=User defined; 7=native Bladed FF)   ', 
            '          0   PropagationDir - Direction of wind propagation (meteoroligical rotation from aligned with X (positive rotates towards -Y) -- degrees)                                ', 
            '          0   VFlowAng       - Upflow angle (degrees) (not used for native Bladed format WindType=7)                                                                               ', 
            '          1   NWindVel       - Number of points to output the wind velocity    (0 to 9)                                                                                            ', 
            '          0   WindVxiList    - List of coordinates in the inertial X direction (m)                                                                                                 ', 
            '          0   WindVyiList    - List of coordinates in the inertial Y direction (m)                                                                                                 ', 
            '        150   WindVziList    - List of coordinates in the inertial Z direction (m)                                                                                                 ', 
            '================== Parameters for Steady Wind Conditions [used only for WindType = 1] =========================                                                                    ', 
            '       15.0   HWindSpeed     - Horizontal windspeed                            (m/s)                                                                                               ', 
            '        150   RefHt          - Reference height for horizontal wind speed      (m)                                                                                                 ', 
            '        0.0   PLexp          - Power law exponent                              (-)                                                                                                 ', 
            '================== Parameters for Uniform wind file   [used only for WindType = 2] ============================                                                                    ', 
            '"unused"    FileName_Uni   - Filename of time series data for uniform wind field.      (-)                                                                                         ', 
            '        150   RefHt_Uni      - Reference height for horizontal wind speed                (m)                                                                                       ', 
            '     125.88   RefLength      - Reference length for linear horizontal and vertical sheer (-)                                                                                       ', 
            '================== Parameters for Binary TurbSim Full-Field files   [used only for WindType = 3] ==============                                                                    ', 
            '"unused"    filename_bts       - name of the full field wind file to use (.bts)                                                                                                    ',
			'================== Parameters for Binary Bladed-style Full-Field files   [used only for WindType = 4] =========                                                                    ', 
            '"unused"      FilenameRoot   - Rootname of the full-field wind file to use (.wnd, .sum)                                                                                            ', 
            'False         TowerFile      - Have tower file (.twr) (flag)                                                                                                                       ', 
            '================== Parameters for HAWC-format binary files  [Only used with WindType = 5] =====================                                                                    ', 
            '"wasp\Output\basic_5u.bin"    FileName_u     - name of the file containing the u-component fluctuating wind (.bin)                                                                 ', 
            '"wasp\Output\basic_5v.bin"    FileName_v     - name of the file containing the v-component fluctuating wind (.bin)                                                                 ', 
            '"wasp\Output\basic_5w.bin"    FileName_w     - name of the file containing the w-component fluctuating wind (.bin)                                                                 ', 
            '         64   nx             - number of grids in the x direction (in the 3 files above) (-)                                                                                       ', 
            '         32   ny             - number of grids in the y direction (in the 3 files above) (-)                                                                                       ', 
            '         32   nz             - number of grids in the z direction (in the 3 files above) (-)                                                                                       ', 
            '         16   dx             - distance (in meters) between points in the x direction    (m)                                                                                       ', 
            '          3   dy             - distance (in meters) between points in the y direction    (m)                                                                                       ', 
            '          3   dz             - distance (in meters) between points in the z direction    (m)                                                                                       ', 
            '        150   RefHt_HAWC     - reference height; the height (in meters) of the vertical center of the grid (m)                                                                     ', 
            ' -------------   Scaling parameters for turbulence   ---------------------------------------------------------                                                                     ',
			'          2   ScaleMethod    - Turbulence scaling method   [0 = none, 1 = direct scaling, 2 = calculate scaling factor based on a desired standard deviation]                      ', 
            '          1   SFx            - Turbulence scaling factor for the x direction (-)   [ScaleMethod=1]                                                                                 ', 
            '          1   SFy            - Turbulence scaling factor for the y direction (-)   [ScaleMethod=1]                                                                                 ', 
            '          1   SFz            - Turbulence scaling factor for the z direction (-)   [ScaleMethod=1]                                                                                 ', 
            '        1.2   SigmaFx        - Turbulence standard deviation to calculate scaling from in x direction (m/s)    [ScaleMethod=2]                                                     ', 
            '        0.8   SigmaFy        - Turbulence standard deviation to calculate scaling from in y direction (m/s)    [ScaleMethod=2]                                                     ', 
            '        0.2   SigmaFz        - Turbulence standard deviation to calculate scaling from in z direction (m/s)    [ScaleMethod=2]                                                     ', 
            '  -------------   Mean wind profile parameters (added to HAWC-format files)   ---------------------------------                                                                    ', 
            '         12   URef           - Mean u-component wind speed at the reference height (m/s)                                                                                           ', 
            '          2   WindProfile    - Wind profile type (0=constant;1=logarithmic,2=power law)                                                                                            ', 
            '        0.2   PLExp_HAWC     - Power law exponent (-) (used for PL wind profile type only)                                                                                         ', 
            '       0.03   Z0             - Surface roughness length (m) (used for LG wind profile type only)                                                                                   ', 
            '          0   XOffset        - Initial offset in +x direction (shift of wind box)                                                                                                  ', 
            '====================== OUTPUT ==================================================                                                                                                   ', 
            'False         SumPrint     - Print summary data to <RootName>.IfW.sum (flag)                                                                                                       ', 
            '              OutList      - The next line(s) contains a list of output parameters.  See OutListParameters.xlsx for a listing of available output channels, (-)                    ', 
            '"Wind1VelX,Wind1VelY,Wind1VelZ"     - Wind velocity at point WindVxiList(1),WindVyiList(1),WindVziList(1).  X, Y, and Z direction components.                                      ', 
            'END of input file (the word "END" must appear in the first 3 columns of this last OutList line)                                                                                    ', 
            '---------------------------------------------------------------------------------------                                                                                            ' 
])

# Check its correct
print(ifw_input_string)
print(len(ifw_input_string))

# Call the inflowWind library/module
# ifw_lib = CDLL('path/filename.so') # won't exist until I compile it!!!

# [errStat, errMsg] = ifw_lib.IFW_INIT_C(ifw_input_string)