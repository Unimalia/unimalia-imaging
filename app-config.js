window.config = {
  routerBasename: '/',
  extensions: [],
  modes: [],
  showStudyList: true,
  defaultDataSourceName: 'unimalia',
  dataSources: [
    {
      namespace: '@ohif/extension-default.dataSourcesModule.dicomweb',
      sourceName: 'unimalia',
      configuration: {
        friendlyName: 'UNIMALIA Orthanc',
        name: 'unimalia',
        qidoRoot: 'https://unimalia-imaging.onrender.com/orthanc/dicom-web',
        wadoRoot: 'https://unimalia-imaging.onrender.com/orthanc/dicom-web',
        wadoUriRoot: 'https://unimalia-imaging.onrender.com/orthanc/wado',
        qidoSupportsIncludeField: true,
        supportsReject: false,
        supportsStow: false,
        imageRendering: 'wadors',
        thumbnailRendering: 'wadors',
      },
    },
  ],
  httpErrorHandler: error => {
    console.warn(error?.status ?? error);
    console.warn(error);
  },
};