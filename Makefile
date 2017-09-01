# Make patches

ORIG	?= Marlin-1.1.5
PATCHED	?= Marlin-1.1.5.patched

DIFF 		= diff
DIFF_ARGS	= -Nur

PATCHES = \
	0001_corexy_invert_y_axis.patch \
	0002_pins_h.patch \
	0003_pins_totumduino_h.patch \
	0004_boards_h.patch \
	0005_temperature_triggers.patch \
	0006_buzzer_h.patch \
	0007_marlin_main.patch \
	0008_marlin_h.patch \
	0100_fabtotum_addons.patch
	
.PHONY: $(PATCHES)

all:

patches: $(PATCHES)

0001_corexy_invert_y_axis.patch:
	diff $(DIFF_ARGS) $(ORIG)/Marlin/planner.cpp $(PATCHED)/Marlin/planner.cpp > $@ ; [ $$? -eq 1 ]

0002_pins_h.patch:
	diff $(DIFF_ARGS) $(ORIG)/Marlin/pins.h $(PATCHED)/Marlin/pins.h > $@ ; [ $$? -eq 1 ]

0003_pins_totumduino_h.patch:
	diff $(DIFF_ARGS) $(ORIG)/Marlin/pins_TOTUMDUINO_V1.h $(PATCHED)/Marlin/pins_TOTUMDUINO_V1.h > $@ ; [ $$? -eq 1 ]

0004_boards_h.patch:
	diff $(DIFF_ARGS) $(ORIG)/Marlin/boards.h $(PATCHED)/Marlin/boards.h > $@ ; [ $$? -eq 1 ]

0005_temperature_triggers.patch:
	diff $(DIFF_ARGS) $(ORIG)/Marlin/temperature.cpp $(PATCHED)/Marlin/temperature.cpp > $@ ; [ $$? -eq 1 ]

0006_buzzer_h.patch:
	diff $(DIFF_ARGS) $(ORIG)/Marlin/buzzer.h $(PATCHED)/Marlin/buzzer.h > $@ ; [ $$? -eq 1 ]
	
0007_marlin_main.patch:
	diff $(DIFF_ARGS) $(ORIG)/Marlin/Marlin_main.cpp $(PATCHED)/Marlin/Marlin_main.cpp > $@ ; [ $$? -eq 1 ]
	
0008_marlin_h.patch:
	diff $(DIFF_ARGS) $(ORIG)/Marlin/Marlin.h $(PATCHED)/Marlin/Marlin.h > $@ ; [ $$? -eq 1 ]

0100_fabtotum_addons.patch:
	diff $(DIFF_ARGS) $(ORIG)/Marlin/fabtotum $(PATCHED)/Marlin/fabtotum  > $@ ; [ $$? -eq 1 ]
	

distclean:
	rm $(PATCHES)
