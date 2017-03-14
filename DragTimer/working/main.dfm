object DragTimerForm: TDragTimerForm
  Left = 261
  Top = 136
  Width = 684
  Height = 417
  Caption = 'DragTimer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 676
    Height = 346
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1041#1083#1086#1082' '#1057#1090#1072#1088#1090
      object Label9: TLabel
        Left = 48
        Top = 8
        Width = 45
        Height = 13
        Caption = 'Track 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 216
        Top = 8
        Width = 45
        Height = 13
        Caption = 'Track 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button3: TButton
        Left = 8
        Top = 88
        Width = 113
        Height = 25
        Caption = #1057#1090#1072#1090#1091#1089' '#1092'/'#1076#1072#1090#1095#1080#1082#1086#1074
        TabOrder = 0
        OnClick = Button3Click
      end
      object ltRedCBox: TCheckBox
        Left = 8
        Top = 24
        Width = 153
        Height = 17
        Caption = #1057#1074#1077#1090#1086#1092#1086#1088' '#1050#1088#1072#1089#1085#1099#1081
        Color = clRed
        ParentColor = False
        TabOrder = 1
        OnClick = ltRedCBoxClick
      end
      object ltYellowCBox: TCheckBox
        Left = 8
        Top = 40
        Width = 153
        Height = 17
        Caption = #1057#1074#1077#1090#1086#1092#1086#1088' '#1046#1077#1083#1090#1099#1081
        Color = clYellow
        ParentColor = False
        TabOrder = 2
        OnClick = ltYellowCBoxClick
      end
      object ltGreenCBox: TCheckBox
        Left = 8
        Top = 56
        Width = 153
        Height = 17
        Caption = #1057#1074#1077#1090#1086#1092#1086#1088' '#1047#1077#1083#1077#1085#1099#1081
        Color = clLime
        ParentColor = False
        TabOrder = 3
        OnClick = ltGreenCBoxClick
      end
      object fdFalseTrack1CBox: TCheckBox
        Left = 8
        Top = 132
        Width = 153
        Height = 17
        Caption = #1092#1072#1083#1100#1096#1089#1090#1072#1088#1090' '#1090#1088#1077#1082#1072' 1'
        TabOrder = 4
      end
      object fdFalseTrack2CBox: TCheckBox
        Left = 8
        Top = 148
        Width = 137
        Height = 17
        Caption = #1092#1072#1083#1100#1096#1089#1090#1072#1088#1090' '#1090#1088#1077#1082#1072' 2'
        TabOrder = 5
      end
      object lt2RedCBox: TCheckBox
        Left = 168
        Top = 24
        Width = 153
        Height = 17
        Caption = #1057#1074#1077#1090#1086#1092#1086#1088' '#1050#1088#1072#1089#1085#1099#1081
        Color = clRed
        ParentColor = False
        TabOrder = 6
        OnClick = lt2RedCBoxClick
      end
      object lt2YellowCBox: TCheckBox
        Left = 168
        Top = 40
        Width = 153
        Height = 17
        Caption = #1057#1074#1077#1090#1086#1092#1086#1088' '#1046#1077#1083#1090#1099#1081
        Color = clYellow
        ParentColor = False
        TabOrder = 7
        OnClick = lt2YellowCBoxClick
      end
      object lt2GreenCBox: TCheckBox
        Left = 168
        Top = 56
        Width = 153
        Height = 17
        Caption = #1057#1074#1077#1090#1086#1092#1086#1088' '#1047#1077#1083#1077#1085#1099#1081
        Color = clLime
        ParentColor = False
        TabOrder = 8
        OnClick = lt2GreenCBoxClick
      end
      object fdReadyTrack1CBox: TCheckBox
        Left = 8
        Top = 161
        Width = 137
        Height = 22
        Caption = #1075#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1090#1088#1077#1082#1072' 1'
        TabOrder = 9
      end
      object fdReadyTrack2CBox: TCheckBox
        Left = 8
        Top = 178
        Width = 137
        Height = 17
        Caption = #1075#1086#1090#1086#1074#1085#1086#1089#1090#1100' '#1090#1088#1077#1082#1072' 2'
        TabOrder = 10
      end
      object fdRefCBox: TCheckBox
        Left = 8
        Top = 194
        Width = 137
        Height = 17
        Caption = #1082#1085#1086#1087#1082#1072' '#1089#1091#1076#1100#1080
        TabOrder = 11
      end
      object Button4: TButton
        Left = 168
        Top = 88
        Width = 153
        Height = 25
        Caption = #1055#1086#1075#1072#1089#1080#1090#1100' '#1074#1089#1077' '#1089#1074#1077#1090#1086#1092#1086#1088#1099
        TabOrder = 12
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 168
        Top = 120
        Width = 153
        Height = 25
        Caption = #1047#1072#1078#1077#1095#1100' '#1074#1089#1077
        TabOrder = 13
        OnClick = Button5Click
      end
      object Button11: TButton
        Left = 168
        Top = 152
        Width = 153
        Height = 25
        Caption = #1055#1088#1080#1082#1086#1083
        TabOrder = 14
        OnClick = Button11Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1041#1083#1086#1082' '#1060#1080#1085#1080#1096
      ImageIndex = 1
      object Label6: TLabel
        Left = 8
        Top = 336
        Width = 102
        Height = 13
        Caption = #1042#1088#1077#1084#1077#1085#1085#1086#1081' '#1076#1080#1074#1080#1079#1086#1088
      end
      object TrackTimerCBox: TCheckBox
        Left = 8
        Top = 8
        Width = 161
        Height = 17
        Caption = #1058#1072#1081#1084#1077#1088' '#1090#1088#1077#1082#1086#1074' '#1074#1082#1083' / '#1074#1099#1082#1083
        TabOrder = 0
        OnClick = TrackTimerCBoxClick
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 32
        Width = 161
        Height = 153
        Caption = ' '#1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1092#1086#1090#1086#1076#1072#1090#1095#1080#1082#1086#1074' '
        TabOrder = 1
        object fdReqBtn: TButton
          Left = 8
          Top = 16
          Width = 113
          Height = 25
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100
          TabOrder = 0
          OnClick = fdReqBtnClick
        end
        object Spd2CBox: TCheckBox
          Left = 8
          Top = 72
          Width = 97
          Height = 17
          Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#8470'2'
          TabOrder = 1
        end
        object Time1CBox: TCheckBox
          Left = 8
          Top = 96
          Width = 97
          Height = 17
          Caption = #1060#1080#1085#1080#1096' '#8470'1'
          TabOrder = 2
        end
        object Time2CBox: TCheckBox
          Left = 8
          Top = 120
          Width = 97
          Height = 17
          Caption = #1060#1080#1085#1080#1096' '#8470'2'
          TabOrder = 3
        end
        object Spd1CBox: TCheckBox
          Left = 8
          Top = 48
          Width = 97
          Height = 17
          Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#8470'1'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 4
        end
      end
      object GroupBox2: TGroupBox
        Left = 176
        Top = 32
        Width = 169
        Height = 153
        Caption = ' '#1057#1090#1072#1090#1091#1089' '#1076#1072#1085#1085#1099#1093' '
        TabOrder = 2
        object DataReqBtn: TButton
          Left = 8
          Top = 16
          Width = 105
          Height = 25
          Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100
          TabOrder = 0
          OnClick = DataReqBtnClick
        end
        object isSpd1CBox: TCheckBox
          Left = 8
          Top = 48
          Width = 120
          Height = 17
          Caption = #1045#1089#1090#1100' '#1089#1082#1086#1088#1086#1089#1090#1100' '#8470'1'
          TabOrder = 1
        end
        object isSpd2CBox: TCheckBox
          Left = 8
          Top = 72
          Width = 120
          Height = 17
          Caption = #1045#1089#1090#1100' '#1089#1082#1086#1088#1086#1089#1090#1100' '#8470'2'
          TabOrder = 2
        end
        object isTime1CBox: TCheckBox
          Left = 8
          Top = 96
          Width = 120
          Height = 17
          Caption = #1045#1089#1090#1100' '#1074#1088#1077#1084#1103' '#8470'1'
          TabOrder = 3
        end
        object isTime2CBox: TCheckBox
          Left = 8
          Top = 120
          Width = 120
          Height = 17
          Caption = #1045#1089#1090#1100' '#1074#1088#1077#1084#1103' '#8470'2'
          TabOrder = 4
        end
      end
      object Time1Btn: TButton
        Left = 8
        Top = 200
        Width = 81
        Height = 25
        Caption = #1042#1088#1077#1084#1103' '#8470'1'
        TabOrder = 3
        OnClick = Time1BtnClick
      end
      object Time2Btn: TButton
        Left = 8
        Top = 232
        Width = 81
        Height = 25
        Caption = #1042#1088#1077#1084#1103' '#8470'2'
        TabOrder = 4
        OnClick = Time2BtnClick
      end
      object Speed1Btn: TButton
        Left = 8
        Top = 264
        Width = 81
        Height = 25
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#8470'1'
        TabOrder = 5
        OnClick = Speed1BtnClick
      end
      object Speed2Btn: TButton
        Left = 8
        Top = 296
        Width = 81
        Height = 25
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#8470'2'
        TabOrder = 6
        OnClick = Speed2BtnClick
      end
      object Time1Edit: TEdit
        Left = 96
        Top = 202
        Width = 73
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 7
        Text = 'Time1Edit'
      end
      object Time2Edit: TEdit
        Left = 96
        Top = 234
        Width = 73
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 8
        Text = 'Time2Edit'
      end
      object Speed1Edit: TEdit
        Left = 96
        Top = 266
        Width = 73
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 9
        Text = 'Speed1Edit'
      end
      object Speed2Edit: TEdit
        Left = 96
        Top = 298
        Width = 73
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 10
        Text = 'Speed2Edit'
      end
      object TimeDivEdit: TSpinEdit
        Left = 8
        Top = 352
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 11
        Value = 24000
        OnChange = TimeDivEditChange
      end
      object Time1TEdit: TEdit
        Left = 176
        Top = 200
        Width = 121
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 12
        Text = 'Time1TEdit'
      end
      object Time2TEdit: TEdit
        Left = 176
        Top = 232
        Width = 121
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 13
        Text = 'Time2TEdit'
      end
      object Speed1TEdit: TEdit
        Left = 176
        Top = 264
        Width = 121
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 14
        Text = 'Speed1TEdit'
      end
      object Speed2TEdit: TEdit
        Left = 176
        Top = 296
        Width = 121
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 15
        Text = 'Speed2TEdit'
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 2
      DesignSize = (
        668
        318)
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 25
        Height = 13
        Caption = #1055#1086#1088#1090
      end
      object Label7: TLabel
        Left = 6
        Top = 83
        Width = 37
        Height = 13
        Caption = #1057#1090#1072#1090#1091#1089':'
      end
      object Memo1: TMemo
        Left = 0
        Top = 120
        Width = 665
        Height = 196
        Anchors = [akLeft, akTop, akRight, akBottom]
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 3
        WordWrap = False
      end
      object cbPort: TComboBox
        Left = 0
        Top = 16
        Width = 81
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'COM1'
        Items.Strings = (
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM5'
          'COM6'
          'COM7'
          'COM8')
      end
      object Button1: TButton
        Left = 88
        Top = 13
        Width = 97
        Height = 25
        Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 192
        Top = 13
        Width = 81
        Height = 25
        Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button6: TButton
        Left = 592
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 4
        OnClick = Button6Click
      end
      object FinishCheckBox: TCheckBox
        Left = 0
        Top = 56
        Width = 121
        Height = 17
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1092#1080#1085#1080#1096#1072
        TabOrder = 5
        OnClick = FinishCheckBoxClick
      end
      object FinishStatusEdit: TEdit
        Left = 48
        Top = 80
        Width = 113
        Height = 21
        ReadOnly = True
        TabOrder = 6
        Text = 'FinishStatusEdit'
      end
      object SPD1CheckBox: TCheckBox
        Left = 176
        Top = 56
        Width = 81
        Height = 17
        Caption = 'SPD1'
        TabOrder = 7
      end
      object FIN1CheckBox: TCheckBox
        Left = 256
        Top = 56
        Width = 65
        Height = 17
        Caption = 'FIN1'
        TabOrder = 8
      end
      object SPD2CheckBox: TCheckBox
        Left = 176
        Top = 72
        Width = 73
        Height = 17
        Caption = 'SPD2'
        TabOrder = 9
      end
      object FIN2CheckBox: TCheckBox
        Left = 256
        Top = 72
        Width = 57
        Height = 17
        Caption = 'FIN2'
        TabOrder = 10
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1063#1077#1084#1087#1080#1086#1085#1072#1090
      ImageIndex = 3
      DesignSize = (
        668
        318)
      object Button7: TButton
        Left = 112
        Top = 8
        Width = 129
        Height = 25
        Caption = #1057#1058#1040#1056#1058
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button7Click
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 40
        Width = 466
        Height = 129
        Caption = '  '#1058#1088#1101#1082' '#8470'1  '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label11: TLabel
          Left = 64
          Top = 19
          Width = 51
          Height = 13
          Caption = #1042#1086#1076#1080#1090#1077#1083#1100':'
          Visible = False
        end
        object Label13: TLabel
          Left = 64
          Top = 43
          Width = 44
          Height = 13
          Caption = #1052#1072#1096#1080#1085#1072':'
          Visible = False
        end
        object Label15: TLabel
          Left = 8
          Top = 16
          Width = 38
          Height = 73
          Caption = '1'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -64
          Font.Name = 'Courier New CYR'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 72
          Top = 80
          Width = 48
          Height = 13
          Caption = #1057#1082#1086#1088#1086#1089#1090#1100
        end
        object Label3: TLabel
          Left = 200
          Top = 80
          Width = 33
          Height = 13
          Caption = #1042#1088#1077#1084#1103
        end
        object T1DriverEdit: TEdit
          Left = 121
          Top = 16
          Width = 296
          Height = 21
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object T1CarEdit: TEdit
          Left = 120
          Top = 40
          Width = 297
          Height = 21
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object T1Red: TMemo
          Left = 432
          Top = 15
          Width = 25
          Height = 25
          Color = clRed
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object T1Yellow: TMemo
          Left = 432
          Top = 41
          Width = 25
          Height = 25
          Color = clYellow
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object T1Green: TMemo
          Left = 432
          Top = 68
          Width = 25
          Height = 25
          Color = clLime
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
        object CheckBox1: TCheckBox
          Left = 328
          Top = 72
          Width = 97
          Height = 17
          Caption = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
          TabOrder = 5
          Visible = False
        end
        object CheckBox3: TCheckBox
          Left = 328
          Top = 88
          Width = 97
          Height = 17
          Caption = #1060#1072#1083#1100#1096#1089#1090#1072#1088#1090
          TabOrder = 6
          Visible = False
        end
        object T1SpdEdit: TEdit
          Left = 64
          Top = 96
          Width = 121
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 7
          Text = 'T1SpdEdit'
        end
        object T1TimeEdit: TEdit
          Left = 192
          Top = 96
          Width = 121
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 8
          Text = 'T1TimeEdit'
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 176
        Width = 466
        Height = 137
        Caption = '  '#1058#1088#1101#1082' '#8470'2  '
        Color = clBtnFace
        Enabled = False
        ParentColor = False
        TabOrder = 2
        object Label12: TLabel
          Left = 80
          Top = 20
          Width = 51
          Height = 13
          Caption = #1042#1086#1076#1080#1090#1077#1083#1100':'
          Visible = False
        end
        object Label14: TLabel
          Left = 80
          Top = 44
          Width = 44
          Height = 13
          Caption = #1052#1072#1096#1080#1085#1072':'
          Visible = False
        end
        object Label16: TLabel
          Left = 8
          Top = 16
          Width = 38
          Height = 73
          Caption = '2'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -64
          Font.Name = 'Courier New CYR'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 80
          Top = 88
          Width = 48
          Height = 13
          Caption = #1057#1082#1086#1088#1086#1089#1090#1100
        end
        object Label5: TLabel
          Left = 208
          Top = 88
          Width = 33
          Height = 13
          Caption = #1042#1088#1077#1084#1103
        end
        object T2DriverEdit: TEdit
          Left = 137
          Top = 17
          Width = 288
          Height = 21
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object T2CarEdit: TEdit
          Left = 136
          Top = 41
          Width = 289
          Height = 21
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object T2Red: TMemo
          Left = 432
          Top = 16
          Width = 25
          Height = 25
          Color = clRed
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object T2Yellow: TMemo
          Left = 432
          Top = 42
          Width = 25
          Height = 25
          Color = clYellow
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object T2Green: TMemo
          Left = 432
          Top = 69
          Width = 25
          Height = 25
          Color = clLime
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
        object CheckBox2: TCheckBox
          Left = 328
          Top = 72
          Width = 97
          Height = 17
          Caption = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
          TabOrder = 5
          Visible = False
        end
        object CheckBox4: TCheckBox
          Left = 328
          Top = 88
          Width = 97
          Height = 17
          Caption = #1060#1072#1083#1100#1096#1089#1090#1072#1088#1090
          TabOrder = 6
          Visible = False
        end
        object T2SpdEdit: TEdit
          Left = 72
          Top = 104
          Width = 121
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 7
          Text = 'T2SpdEdit'
        end
        object T2TimeEdit: TEdit
          Left = 200
          Top = 104
          Width = 121
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 8
          Text = 'T2TimeEdit'
        end
      end
      object Button8: TButton
        Left = 248
        Top = 8
        Width = 75
        Height = 25
        Caption = #1057#1058#1054#1055
        TabOrder = 3
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Caption = #1055#1054#1044#1043#1054#1058#1054#1042#1050#1040
        TabOrder = 4
        OnClick = Button9Click
      end
      object ReadyBtn: TButton
        Left = 344
        Top = 8
        Width = 81
        Height = 25
        Caption = #1043#1054#1058#1054#1042#1054
        TabOrder = 5
        OnClick = ReadyBtnClick
      end
      object DragMemo: TMemo
        Left = 480
        Top = 8
        Width = 185
        Height = 305
        Anchors = [akLeft, akTop, akRight, akBottom]
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 6
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 346
    Width = 676
    Height = 17
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Left = 464
    Top = 32
    object N1: TMenuItem
      Caption = #1052#1077#1085#1102
      object N2: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        OnClick = N2Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N5: TMenuItem
      Caption = '?'
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 400
    OnTimer = Timer1Timer
    Left = 396
    Top = 32
  end
  object XCommp: TXComm
    BaudRate = br115200
    BaudValue = 115200
    Buffers.InputSize = 2048
    Buffers.OutputSize = 2048
    Buffers.InputTimeout = 10
    Buffers.OutputTimeout = 10
    RTSSettings = []
    DataControl.DataBits = db8
    DataControl.Parity = paNone
    DataControl.StopBits = sb1
    DeviceName = 'COM2'
    DTRSettings = []
    EventChars.XonChar = #17
    EventChars.XoffChar = #19
    EventChars.EofChar = #0
    EventChars.ErrorChar = #0
    EventChars.EventChar = #10
    MonitorEvents = [deChar, deFlag, deOutEmpty, deCTS, deError]
    FlowControl = fcNone
    Options = []
    Synchronize = True
    Timeouts.ReadInterval = 1
    Timeouts.ReadMultiplier = 0
    Timeouts.ReadConstant = 1
    Timeouts.WriteMultiplier = 0
    Timeouts.WriteConstant = 1
    XOnXOffSettings = []
    OnCommEvent = XCommpCommEvent
    Left = 340
    Top = 32
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer2Timer
    Left = 428
    Top = 32
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer3Timer
    Left = 364
    Top = 32
  end
end
