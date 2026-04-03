window.config = {
  routerBasename: "/",
  extensions: [],

  dataSources: [
    {
      namespace: "@ohif/extension-default.dataSourcesModule.dicomweb",
      sourceName: "dicomweb",
      configuration: {
        friendlyName: "UNIMALIA Orthanc",

        qidoRoot: "/dicom-web",
        wadoRoot: "/dicom-web",
        wadoUriRoot: "/wado",

        supportsFuzzyMatching: true,
        supportsWildcard: true,
      },
    },
  ],

  defaultDataSourceName: "dicomweb",
};