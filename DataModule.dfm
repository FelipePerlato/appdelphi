object dm: Tdm
  OldCreateOrder = False
  Height = 470
  Width = 658
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=F:\PROGRAMA MOBILE\PROGRAMA MOBILE\DB\database.db'
      'LockingMode=Normal'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 80
    Top = 80
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 224
    Top = 88
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConn
    Left = 96
    Top = 248
  end
  object qry_geral: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from login where email =:pemail')
    Left = 400
    Top = 96
    ParamData = <
      item
        Name = 'PEMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qry_geralidcadastro: TFDAutoIncField
      FieldName = 'idcadastro'
      Origin = 'idcadastro'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_geralnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 15
    end
    object qry_geralemail: TStringField
      FieldName = 'email'
      Origin = 'email'
    end
    object qry_geralsenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 8
    end
  end
  object DtsRegistro: TDataSource
    Left = 456
    Top = 312
  end
  object qry_veiculo: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from veiculos;')
    Left = 512
    Top = 96
    object qry_veiculoidveiculo: TFDAutoIncField
      FieldName = 'idveiculo'
      Origin = 'idveiculo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_veiculoplaca: TStringField
      FieldName = 'placa'
      Origin = 'placa'
      Size = 7
    end
    object qry_veiculonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
    end
    object qry_veiculomodelo: TStringField
      FieldName = 'modelo'
      Origin = 'modelo'
    end
    object qry_veiculolitros: TStringField
      FieldName = 'litros'
      Origin = 'litros'
      Size = 2
    end
    object qry_veiculodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
  end
end
