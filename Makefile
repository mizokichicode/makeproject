#
# Makefile for project
#

ifdef name
	TARGET = ${name}
else
	TARGET = test
endif

ifdef type
	TYPE = ${type}
else
	TYPE = App
endif

BIN = bin
INC = include
LIB = lib
OBJ = obj
SRC = src

README = ./${TARGET}/README.md
GITIGN = ./${TARGET}/.gitignore
MKFILE = ./${TARGET}/Makefile
BASEMKFILE = ./__Makefile_${TYPE}

.PHONY: project
project:
	mkdir -p ./${TARGET}/${BIN}
	mkdir -p ./${TARGET}/${INC}
	mkdir -p ./${TARGET}/${LIB}
	mkdir -p ./${TARGET}/${OBJ}
	mkdir -p ./${TARGET}/${SRC}

.PHONY: mkfile
mkfile:
	echo "#" > ${MKFILE}
	echo "# Makefile for ${TARGET}" >> ${MKFILE}
	echo "#\\n" >> ${MKFILE}
	echo "TARGET = ${TARGET}" >> ${MKFILE}
	echo "" >> ${MKFILE}
	cat ${BASEMKFILE} >> ${MKFILE}

.PHONY: git
git:
	echo "${TARGET}" > ${README}
	echo "===" >> ${README}
	echo ".DS_Store" > ${GITIGN}
	echo "[Bb]in/" >> ${GITIGN}
	echo "[Ll]ib/" >> ${GITIGN}
	echo "[Oo]bj/" >> ${GITIGN}
	echo "${TARGET}" >> ${GITIGN}
	echo "${TARGET}.*" >> ${GITIGN}

.PHONY: all
all: project git mkfile

.PHONY: clean
clean:
	rm -rfv ./${TARGET}
