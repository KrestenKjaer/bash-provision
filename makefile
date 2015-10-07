NEXUS_USER=kkj
VERSION=1.0.0

clean:
	rm *.zip
	rm *.rpm
	rm -R root/opt

package-rpm:
	mkdir -p target
	mkdir -p root/opt/miracle/bash-provision
	cp -r bin root/opt/miracle/bash-provision
	cp -r types root/opt/miracle/bash-provision
	cp -r lib root/opt/miracle/bash-provision
	cd root && fpm -n bash-provision -v ${VERSION} -s dir -t rpm opt
	mv root/*.rpm target/

package-deb:
	mkdir -p target
	mkdir -p root/opt/miracle/bash-provision
	cp -r bin root/opt/miracle/bash-provision
	cp -r types root/opt/miracle/bash-provision
	cp -r lib root/opt/miracle/bash-provision
	cd root && fpm -n bash-provision -v ${VERSION} -s dir -t deb opt
	mv root/*.deb target/

upload-rpm:
	curl -v -u kkj:Miracle42 --upload-file target/bash-provision-1.0.0_SNAPSHOT-1.x86_64.rpm  http://nexus.miracle.local/nexus/service/local/repositories/jenkins-rpm/content/dk/miracle/rpm/bash-provision/${VERSION}/bash-provision-${VERSION}.x86_64.rpm

upload-deb:
	curl -v -u kkj:Miracle42 --upload-file target/bash-provision_1.0.0-SNAPSHOT_amd64.deb  http://nexus.miracle.local/nexus/service/local/repositories/jenkins-rpm/content/dk/miracle/deb/bash-provision/${VERSION}/bash-provision-${VERSION}_amd64.deb
