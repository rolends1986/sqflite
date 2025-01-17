package com.tekartik.sqflite.math.operation;

import com.tekartik.sqflite.math.SqlCommand;

/**
 * Created by alex on 09/01/18.
 */

public interface Operation extends OperationResult {

    String getMethod();

    <T> T getArgument(String key);

    SqlCommand getSqlCommand();

    boolean getNoResult();

    // In batch, means ignoring the error
    boolean getContinueOnError();
}
