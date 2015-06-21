# `adocker` is alias to `azk docker`
all:
	adocker build -t azukiapp/alphine 3.2
	adocker build -t azukiapp/alphine:3.2 3.2

no-cache:
	adocker build --rm --no-cache -t azukiapp/alphine 3.2
