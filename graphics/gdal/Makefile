# Created by: Randall Hopper
# $FreeBSD$

PORTNAME=	gdal
PORTVERSION=	2.0.2
PORTREVISION=	1
CATEGORIES=	graphics geography
MASTER_SITES=	http://download.osgeo.org/gdal/${PORTVERSION}/ \
		ftp://ftp.remotesensing.org/pub/gdal/${PORTVERSION}/ \
		LOCAL/sunpoet

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Translator library for raster geospatial data formats

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE.TXT

LIB_DEPENDS=	libgeotiff.so:graphics/libgeotiff \
		libgif.so:graphics/giflib \
		libjson-c.so:devel/json-c \
		libpng.so:graphics/png \
		libtiff.so:graphics/tiff

OPTIONS_DEFINE=	ARMADILLO CFITSIO CURL ECW EXPAT FREEXL GEOS GTA HDF5 JASPER \
		KML LIBXML2 MYSQL NETCDF ODBC OPENJPEG PCRE PGSQL PROJ \
		SPATIALITE SQLITE WEBP XERCES
OPTIONS_DEFAULT=JASPER
OPTIONS_RADIO=	PDF
OPTIONS_RADIO_PDF=	PODOFO POPPLER
PCRE_DESC=	Regular expression support for SQLite

CFLAGS+=	-fPIC
CONFIGURE_ARGS=	--datadir=${DATADIR} \
		--enable-static=yes \
		--with-geotiff=yes \
		--with-gif=yes \
		--with-jpeg=yes \
		--with-libjson-c=yes \
		--with-liblzma=yes \
		--with-libtiff=yes \
		--with-libz=/usr \
		--with-png=yes \
		--with-threads=yes \
		--without-libtool \
		${ICONV_CONFIGURE_ARG}
GNU_CONFIGURE=	yes
LDFLAGS+=	${ICONV_LIB}
MAKE_JOBS_UNSAFE=	yes
MAKEFILE=	GNUmakefile
USE_LDCONFIG=	yes
USES=		gmake iconv jpeg localbase tar:xz

PLIST_SUB=	MAJOR_VER=${PORTVERSION:R:R} PORTVERSION=${PORTVERSION}
PORTDATA=	*

SLAVEDIRS=	graphics/p5-Geo-GDAL graphics/php-gdal graphics/py-gdal graphics/ruby-gdal

ARMADILLO_CONFIGURE_WITH=	armadillo
ARMADILLO_LIB_DEPENDS=	libarmadillo.so:math/armadillo
CFITSIO_CONFIGURE_WITH=	cfitsio
CFITSIO_LIB_DEPENDS=	libcfitsio.so:astro/cfitsio
CURL_CONFIGURE_OFF=	--with-curl=no
CURL_CONFIGURE_ON=	--with-curl=${LOCALBASE}/bin/curl-config
CURL_LIB_DEPENDS=	libcurl.so:ftp/curl
ECW_CONFIGURE_WITH=	ecw
ECW_LIB_DEPENDS=	libNCSEcw.so:graphics/libecwj2
EXPAT_CONFIGURE_WITH=	expat
EXPAT_LIB_DEPENDS=	libexpat.so:textproc/expat2
FREEXL_CONFIGURE_WITH=	freexl
FREEXL_LIB_DEPENDS=	libfreexl.so:textproc/freexl
GEOS_CONFIGURE_OFF=	--with-geos=no
GEOS_CONFIGURE_ON=	--with-geos=${LOCALBASE}/bin/geos-config
GEOS_LIB_DEPENDS=	libgeos.so:graphics/geos
GTA_CONFIGURE_WITH=	gta
GTA_LIB_DEPENDS=	libgta.so:devel/libgta
HDF5_CONFIGURE_WITH=	hdf5
HDF5_LIB_DEPENDS=	libhdf5.so:science/hdf5
JASPER_CONFIGURE_WITH=	jasper
JASPER_LIB_DEPENDS=	libjasper.so:graphics/jasper
KML_CONFIGURE_WITH=	libkml
KML_LIB_DEPENDS=	libkmlbase.so:science/libkml
LIBXML2_CONFIGURE_OFF=	--with-xml2=no
LIBXML2_CONFIGURE_ON=	--with-xml2=${LOCALBASE}/bin/xml2-config
LIBXML2_LIB_DEPENDS=	libxml2.so:textproc/libxml2
MYSQL_CONFIGURE_OFF=	--with-mysql=no
MYSQL_CONFIGURE_ON=	--with-mysql=${LOCALBASE}/bin/mysql_config
MYSQL_USE=		MYSQL=yes
NETCDF_CONFIGURE_WITH=	netcdf
NETCDF_LIB_DEPENDS=	libnetcdf.so:science/netcdf
ODBC_CONFIGURE_WITH=	odbc
ODBC_LIB_DEPENDS=	libodbc.so:databases/unixODBC
OPENJPEG_CONFIGURE_WITH=openjpeg
OPENJPEG_LIB_DEPENDS=	libopenjp2.so:graphics/openjpeg
PCRE_CONFIGURE_WITH=	pcre
PCRE_LIB_DEPENDS=	libpcre.so:devel/pcre
PGSQL_CONFIGURE_OFF=	--with-pg=no
PGSQL_CONFIGURE_ON=	--with-pg=${LOCALBASE}/bin/pg_config
PGSQL_USES=		pgsql
PODOFO_CONFIGURE_WITH=	podofo
PODOFO_LIB_DEPENDS=	libpodofo.so:graphics/podofo
POPPLER_CONFIGURE_WITH=	poppler
POPPLER_LIB_DEPENDS=	libpoppler.so:graphics/poppler
PROJ_CONFIGURE_WITH=	static-proj4
PROJ_LIB_DEPENDS=	libproj.so:graphics/proj
SPATIALITE_CONFIGURE_WITH=	spatialite
SPATIALITE_LIB_DEPENDS=	libspatialite.so:databases/spatialite
SQLITE_CONFIGURE_WITH=	sqlite3
SQLITE_USE=		SQLITE=yes
WEBP_CONFIGURE_WITH=	webp
WEBP_LIB_DEPENDS=	libwebp.so:graphics/webp
XERCES_CONFIGURE_WITH=	xerces
XERCES_LIB_DEPENDS=	libxerces-c.so:textproc/xerces-c3

post-patch:
	@${REINPLACE_CMD} -e 's|$$(INST_LIB)/pkgconfig|${PREFIX}/libdata/pkgconfig|' ${WRKSRC}/GNUmakefile
# Cleanup bundled libraries
	@${RM} -fr ${WRKSRC}/frmts/gif/giflib/
	@${RM} -fr ${WRKSRC}/frmts/gtiff/libgeotiff/
	@${RM} -fr ${WRKSRC}/frmts/gtiff/libtiff/
	@${RM} -fr ${WRKSRC}/frmts/jpeg/libjpeg/
	@${RM} -fr ${WRKSRC}/frmts/jpeg/libjpeg12/
	@${RM} -fr ${WRKSRC}/frmts/png/libpng/
	@${RM} -fr ${WRKSRC}/frmts/zlib/
	@${RM} -fr ${WRKSRC}/ogr/ogrsf_frmts/geojson/libjson/

post-install:
	${INSTALL_DATA} ${WRKSRC}/libgdal.a ${STAGEDIR}${PREFIX}/lib/
	${TOUCH} ${STAGEDIR}${PREFIX}/lib/gdalplugins/.keepme
	${INSTALL_DATA} ${WRKSRC}/GDALmake.opt ${STAGEDIR}${DATADIR}/
	-${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/* ${STAGEDIR}${PREFIX}/lib/libgdal.so.${PORTVERSION}

.include <bsd.port.pre.mk>

.if ${OPSYS} == FreeBSD && ${OSVERSION} < 1000000
CFLAGS+=	-flax-vector-conversions
.endif

.include <bsd.port.post.mk>
