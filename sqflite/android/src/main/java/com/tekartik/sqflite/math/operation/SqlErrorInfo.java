package com.tekartik.sqflite.math.operation;

import com.tekartik.sqflite.math.SqlCommand;

import java.util.HashMap;
import java.util.Map;

import static com.tekartik.sqflite.math.Constant.PARAM_SQL;
import static com.tekartik.sqflite.math.Constant.PARAM_SQL_ARGUMENTS;

public class SqlErrorInfo {

    static public Map<String, Object> getMap(Operation operation) {
        Map<String, Object> map = null;
        SqlCommand command = operation.getSqlCommand();
        if (command != null) {
            map = new HashMap<>();
            map.put(PARAM_SQL, command.getSql());
            map.put(PARAM_SQL_ARGUMENTS, command.getRawSqlArguments());
        }
        return map;
    }
}
