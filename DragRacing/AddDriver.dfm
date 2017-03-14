object AddForm: TAddForm
  Left = 163
  Top = 147
  BorderStyle = bsDialog
  Caption = #1042#1085#1077#1089#1077#1085#1080#1077' '#1091#1095#1072#1089#1090#1085#1080#1082#1086#1074
  ClientHeight = 311
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 90
    Height = 13
    Caption = #1060'.'#1048'.'#1054'. '#1091#1095#1072#1089#1090#1085#1080#1082#1072
  end
  object Label2: TLabel
    Left = 208
    Top = 0
    Width = 20
    Height = 13
    Caption = #1053#1080#1082
  end
  object Label3: TLabel
    Left = 8
    Top = 40
    Width = 79
    Height = 13
    Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
  end
  object Label4: TLabel
    Left = 168
    Top = 40
    Width = 39
    Height = 13
    Caption = #1052#1086#1076#1077#1083#1100
  end
  object Label5: TLabel
    Left = 8
    Top = 80
    Width = 53
    Height = 13
    Caption = #1054#1073#1098#1077#1084', cc'
  end
  object Label6: TLabel
    Left = 168
    Top = 80
    Width = 69
    Height = 13
    Caption = #1058#1088#1072#1085#1089#1084#1080#1089#1089#1080#1103
  end
  object Label7: TLabel
    Left = 8
    Top = 120
    Width = 37
    Height = 13
    Caption = #1056#1077#1079#1080#1085#1072
  end
  object Label8: TLabel
    Left = 168
    Top = 120
    Width = 37
    Height = 13
    Caption = #1041#1077#1085#1079#1080#1085
  end
  object Label9: TLabel
    Left = 248
    Top = 120
    Width = 56
    Height = 13
    Caption = #1043#1086#1089'. '#1085#1086#1084#1077#1088
  end
  object Label10: TLabel
    Left = 120
    Top = 160
    Width = 153
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  end
  object Label11: TLabel
    Left = 104
    Top = 80
    Width = 31
    Height = 13
    Caption = #1050#1083#1072#1089#1089
  end
  object AddBtn: TButton
    Left = 8
    Top = 256
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = AddBtnClick
  end
  object FIOEdit: TEdit
    Left = 8
    Top = 16
    Width = 193
    Height = 21
    TabOrder = 1
  end
  object NickEdit: TEdit
    Left = 208
    Top = 16
    Width = 105
    Height = 21
    TabOrder = 2
  end
  object FirmBox: TComboBox
    Left = 8
    Top = 56
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
    OnChange = FirmBoxChange
    OnSelect = FirmBoxSelect
  end
  object ModelBox: TComboBox
    Left = 168
    Top = 56
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object VolumeBox: TComboBox
    Left = 8
    Top = 96
    Width = 89
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = '1600'
    OnChange = VolumeBoxChange
    OnSelect = VolumeBoxSelect
    Items.Strings = (
      #1085'/'#1091
      '1300'
      '1500'
      '1600'
      '1800'
      '2000'
      '2200'
      '2500'
      '4000'
      '5000')
  end
  object TransBox: TComboBox
    Left = 168
    Top = 96
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 6
    Text = #1050#1086#1088#1086#1073#1082#1072
    Items.Strings = (
      #1040#1074#1090#1086#1084#1072#1090
      #1050#1086#1088#1086#1073#1082#1072
      #1057#1086#1074#1084#1077#1097#1077#1085)
  end
  object TurbinCBox: TCheckBox
    Left = 8
    Top = 160
    Width = 97
    Height = 17
    Caption = #1058#1091#1088#1073#1080#1085#1072
    TabOrder = 7
    OnClick = TurbinCBoxClick
    OnKeyPress = TurbinCBoxKeyPress
  end
  object SChargeCBox: TCheckBox
    Left = 8
    Top = 176
    Width = 97
    Height = 17
    Caption = #1057#1091#1087#1077#1088' '#1095#1072#1088#1076#1078#1077#1088
    TabOrder = 8
    OnClick = SChargeCBoxClick
    OnKeyPress = SChargeCBoxKeyPress
  end
  object ResinBox: TComboBox
    Left = 8
    Top = 136
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 9
    Text = #1051#1077#1090#1085#1103#1103
    Items.Strings = (
      #1051#1077#1090#1085#1103#1103
      #1047#1080#1084#1085#1103#1103
      #1042#1089#1077#1089#1077#1079#1086#1085'.')
  end
  object GasBox: TComboBox
    Left = 168
    Top = 136
    Width = 65
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 10
    Items.Strings = (
      #1085'/'#1091
      #1044#1058
      '76'
      '92'
      '93'
      '95'
      '96'
      '98')
  end
  object GosNumEdit: TEdit
    Left = 248
    Top = 136
    Width = 65
    Height = 21
    TabOrder = 11
  end
  object DriversView: TListView
    Left = 320
    Top = 8
    Width = 257
    Height = 265
    Columns = <
      item
        Caption = #8470
      end
      item
        Caption = #1060#1048#1054
      end
      item
        Caption = #1052#1072#1096#1080#1085#1072
      end
      item
        Caption = #1050#1083#1072#1089#1089
      end>
    RowSelect = True
    TabOrder = 12
    ViewStyle = vsReport
    ReadOnly = True
  end
  object CommentsMemo: TMemo
    Left = 120
    Top = 176
    Width = 193
    Height = 97
    TabOrder = 13
  end
  object ClassEdit: TEdit
    Left = 104
    Top = 96
    Width = 49
    Height = 21
    TabOrder = 14
  end
  object RotorCBox: TCheckBox
    Left = 8
    Top = 192
    Width = 97
    Height = 17
    Caption = #1056#1086#1090#1086#1088#1085#1099#1081' '#1076'-'#1083#1100
    TabOrder = 15
    OnClick = RotorCBoxClick
    OnKeyPress = RotorCBoxKeyPress
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 292
    Width = 579
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object racingcon: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 96
    Top = 240
  end
  object dataset: TADODataSet
    Connection = racingcon
    Parameters = <>
    Left = 128
    Top = 240
  end
end
