object Form1: TForm1
  Left = 182
  Top = 138
  Width = 745
  Height = 443
  Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1092#1091#1085#1082#1094#1080#1080' '#1074' K '#1090#1086#1095#1082#1072#1093' '#1086#1090' A '#1076#1086' B'
  Caption = #1055#1086#1080#1089#1082' '#1082#1086#1088#1085#1103' '#1091#1088#1072#1074#1085#1077#1085#1080#1103' '#1076#1074#1091#1084#1103' '#1084#1077#1090#1086#1076#1072#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 249
    Height = 13
    Caption = #1054#1090#1088#1077#1079#1086#1082' AB '#1080' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' N '#1079#1085#1072#1095#1077#1085#1080#1081' '#1090#1086#1095#1085#1086#1089#1090#1080' '#1045
  end
  object Label2: TLabel
    Left = 8
    Top = 120
    Width = 7
    Height = 13
    Caption = #1040
  end
  object Label3: TLabel
    Left = 8
    Top = 144
    Width = 6
    Height = 13
    Caption = #1042
  end
  object Label4: TLabel
    Left = 8
    Top = 168
    Width = 7
    Height = 13
    Caption = 'N'
  end
  object Label5: TLabel
    Left = 256
    Top = 8
    Width = 102
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1095#1077#1082' K'
  end
  object Label6: TLabel
    Left = 256
    Top = 32
    Width = 6
    Height = 13
    Caption = 'K'
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 241
    Height = 65
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1091#1085#1082#1094#1080#1102
    ItemIndex = 0
    Items.Strings = (
      'f1=(Exp(1/7*ln(x))-ln(x+0.3))/sqrt(x+1)-x'
      'f2=(ln(44.8)-sin(Sqrt(x)))/2-x')
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 16
    Top = 112
    Width = 169
    Height = 21
    TabOrder = 1
    Text = '0,01'
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 16
    Top = 136
    Width = 169
    Height = 21
    TabOrder = 2
    Text = '1,99'
    OnExit = Edit2Exit
  end
  object Edit3: TEdit
    Left = 16
    Top = 160
    Width = 153
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = '7'
  end
  object UpDown1: TUpDown
    Left = 169
    Top = 160
    Width = 15
    Height = 21
    Associate = Edit3
    Min = 1
    Max = 10
    Position = 7
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 264
    Top = 24
    Width = 89
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = '3'
  end
  object UpDown2: TUpDown
    Left = 353
    Top = 24
    Width = 15
    Height = 21
    Associate = Edit4
    Min = 2
    Max = 200
    Position = 3
    TabOrder = 6
  end
  object Button1: TButton
    Left = 256
    Top = 48
    Width = 113
    Height = 25
    Caption = #1055#1086#1076#1089#1095#1080#1090#1072#1090#1100
    TabOrder = 7
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 376
    Top = 8
    Width = 353
    Height = 65
    ColCount = 4
    DefaultColWidth = 85
    RowCount = 2
    FixedRows = 0
    TabOrder = 8
    RowHeights = (
      26
      28)
  end
  object Button2: TButton
    Left = 376
    Top = 80
    Width = 353
    Height = 25
    Hint = #1056#1080#1089#1086#1074#1072#1090#1100' '#1075#1088#1072#1092#1080#1082' '#1076#1083#1103' 100 '#1090#1086#1095#1077#1082' '#1086#1090' A '#1076#1086' B'
    Caption = #1043#1088#1072#1092#1080#1082
    TabOrder = 9
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 192
    Top = 112
    Width = 177
    Height = 25
    Hint = 
      #1053#1072#1081#1090#1080' '#1082#1086#1088#1085#1080' '#1076#1074#1091#1084#1103' '#1084#1077#1090#1086#1076#1072#1084#1080' '#1076#1083#1103' N '#1079#1085#1072#1095#1077#1085#1080#1081' '#1090#1086#1095#1085#1086#1089#1090#1080' E: 0,1; 0,01;' +
      ' 0,001; ...'
    Caption = #1053#1072#1081#1090#1080' '#1082#1086#1088#1077#1085#1100
    TabOrder = 10
    OnClick = Button3Click
  end
  object StringGrid2: TStringGrid
    Left = 8
    Top = 192
    Width = 361
    Height = 209
    DefaultColWidth = 70
    RowCount = 8
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 11
    RowHeights = (
      24
      25
      24
      24
      24
      24
      24
      24)
  end
  object Chart1: TChart
    Left = 376
    Top = 112
    Width = 353
    Height = 289
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1043#1088#1072#1092#1080#1082' '#1092#1091#1085#1082#1094#1080#1080)
    Legend.Visible = False
    View3D = False
    TabOrder = 12
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      OnClick = Series1Click
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clNavy
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
end
