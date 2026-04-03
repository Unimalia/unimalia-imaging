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
        qidoRoot: '/orthanc/dicom-web',
        wadoRoot: '/orthanc/dicom-web',
        wadoUriRoot: '/orthanc/wado',
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