# Created by: will
# $FreeBSD$

PORTNAME=	CGI-Application
PORTVERSION=	4.50
PORTREVISION=	2
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl module intended to make it easier to create reusable web apps

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Class-ISA>=0:devel/p5-Class-ISA \
		p5-HTML-Template>=0:www/p5-HTML-Template
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-CGI-PSGI>=0:www/p5-CGI-PSGI \
		p5-CGI-Simple>=0:www/p5-CGI-Simple

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
