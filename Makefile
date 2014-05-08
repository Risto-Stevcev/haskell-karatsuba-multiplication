GHC = ghc

.PHONY:
default: TestKaratsuba

TestKaratsuba:
	$(GHC) TestKaratsuba.hs -o TestKaratsuba

.PHONY:
all: clean TestKaratsuba

.PHONY:
clean:
	rm -f *.o *.hi *.*~ TestKaratsuba
