export default {
  admin: {
    authorize: {
      clientId: '15',
      clientSecret: 'KpUmmiC0lFDQmGNmOpmZuXf04Lifi1HjFvh1tUh7'
    },
    loginRouteName: 'adminLogin',

    dashboardName: 'adminDashboard',

    dashboardFullPath: '/admin/dashboard',

    appName: {
      fullName: '后台管理',
      abbrName: '创新'
    },

    locale: 'zh_CN'
  },
  member: {
      authorize: {
          clientId: 2,
          clientSecret: '9tBGaDo6M0IFVFXU62HH6pYlov4rO8tGN2I4x86y'
      },
      loginRouteName: 'memberLogin',

      dashboardName: 'memberDashboard',

      dashboardFullPath: ' /member/dashboard',

      appName: {
          fullName: '会员中心',
          abbrName: '会员'
      },

      locale: 'zh_CN'
  },
  users: {
    authorize: {
        clientId: 14,
        clientSecret: '7uQlrq48eftxY62iHkQYI0VMAsXBz0gRSr3awXao'
    },
    loginRouteName: 'userLogin',


    locale: 'zh_CN'
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
    ,
    {
        label: 'users',
        value: 'users'
    }

  ],

  apiUrl: '',

  //Unit is day
  tokenTTL: 1,

  //Unit is day
  refreshTokenTTL: 7,

  showAuthorGitHubUrl: true,
}