class Benefits < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '金運' },
    { id: 2, name: '商売繁盛' },
    { id: 3, name: '恋愛運(縁結び)' },
    { id: 4, name: '学問(合格祈願)' },
    { id: 5, name: '健康(病気平癒)' },
    { id: 6, name: '子宝(安産)' },
    { id: 7, name: '厄除け' },
    { id: 8, name: '夫婦円満(家内安全)' },
    { id: 9, name: '心願成就' },
    { id: 10, name: '勝負運(必勝・出世)' },
    { id: 11, name: '交通安全' },
    { id: 12, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :shrines
end