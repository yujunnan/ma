export default {
  admin: {
    authorize: {
      clientId: 2,
      clientSecret: '9tBGaDo6M0IFVFXU62HH6pYlov4rO8tGN2I4x86y'
    },
    loginRouteName: 'adminLogin',

    dashboardName: 'adminDashboard',

    dashboardFullPath: '/admin/dashboard',

    appName: {
      fullName: 'Mojito Admin',
      abbrName: 'Mojito'
    },

    locale: 'en'
  },
  member: {
      authorize: {
          clientId: 2,
          clientSecret: '9tBGaDo6M0IFVFXU62HH6pYlov4rO8tGN2I4x86y'
      },
      loginRouteName: 'memberLogin',

      dashboardName: 'memberDashboard',

      dashboardFullPath: '/member/dashboard',

      appName: {
          fullName: 'Member Centre ',
          abbrName: 'Member'
      },

      locale: 'en'
  },
  guardNames: [
    {
      label: 'admin',
      value: 'admin'
    },
    {
        label: 'member',
        value: 'member'
    }


  ],

  apiUrl: '',

  //Unit is day
  tokenTTL: 1,

  //Unit is day
  refreshTokenTTL: 7,

  showAuthorGitHubUrl: true,
}