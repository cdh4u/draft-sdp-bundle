xml2rfc ?= xml2rfc -v

draft := draft-ietf-mmusic-sdp-bundle-negotiation

.PHONY: latest diff clean

latest: $(draft).txt $(draft).html

diff:  $(draft).diff.html

clean:
	-rm -f $(draft).txt $(draft).raw $(draft).old.raw $(draft).html $(draft).diff.html
	-rm -f $(next).txt $(next).raw $(next).html
	-rm -f $(draft)-[0-9][0-9].xml

%.txt: %.xml
	$(xml2rfc) $< --text --out $@

%.raw: %.xml
	$(xml2rfc) $< --raw --out $@

%.html: %.xml
	$(xml2rfc) $< --html --out $@

$(draft).diff.html: $(draft).old.raw $(draft).raw 
	htmlwdiff  $^ >  $@

