
QT += core gui
CONFIG += console

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = YooIRIS
TEMPLATE = app

SOURCES += \
	main.cpp \
	CVImageSource.cpp \
	ImageWidget.cpp \
	ModeDialog.cpp \
	YooIRIS.cpp \
	YooUtility.cpp \
    InputDialog.cpp

HEADERS  += \
	CVImageSource.h \
	ImageSource.h \
	ImageWidget.h \
	ModeDialog.h \
	YooIRIS.h \
    InputDialog.h

FORMS    += \
	ModeDialog.ui \
	YooIRIS.ui \
    InputDialog.ui

# Analysis, MasekAlg, VASIR dependency


CONFIG(debug) {	
	LIBS += -L$$PWD/../Build/MasekAlg/debug/ -lMasekAlg
	LIBS += -L$$PWD/../Build/VASIR/debug/ -lVASIR
	LIBS += -L$$PWD/../Build/Analysis/debug/ -lAnalysis
} else {	
	LIBS += -L$$PWD/../Build/MasekAlg/release/ -lMasekAlg
	LIBS += -L$$PWD/../Build/VASIR/release/ -lVASIR
	LIBS += -L$$PWD/../Build/Analysis/release/ -lAnalysis
}

INCLUDEPATH += $$PWD/../Analysis $$PWD/../MasekAlg $$PWD/../VASIR
DEPENDPATH += $$PWD/../Analysis $$PWD/../MasekAlg $$PWD/../VASIR


win32 {
        # Add Windows path to OpenCV library and header files here

        #LIBS += -LC:\\QtVSCV\\OpenCV-2.3.1\\opencv_binaries\\lib\\Debug \
        LIBS += -LC:\\OpenCV-2.3.1\\opencv_binaries\\lib\\Debug \
            -lopencv_core231d \
            -lopencv_imgproc231d \
            -lopencv_highgui231d \
            -lopencv_objdetect231d \
            -lopencv_legacy231d

        #INCLUDEPATH += C:\\QtVSCV\\OpenCV-2.3.1\\build\\include
        INCLUDEPATH += C:\\OpenCV-2.3.1\\build\\include
}
else:mac {
    # Add Mac or Linux path to OpenCV library and header files here
        LIBS += -L/opt/local/lib/ \
        -lopencv_core \
        -lopencv_imgproc \
        -lopencv_highgui \
        -lopencv_objdetect \
        -lopencv_legacy

        INCLUDEPATH += /opt/local/include


}

# OpenCV dependency



