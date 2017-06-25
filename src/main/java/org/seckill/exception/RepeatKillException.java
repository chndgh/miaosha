package org.seckill.exception;

/**
 * Created by dingguohua on 16/7/19.
 */
public class RepeatKillException extends RuntimeException {

    public RepeatKillException(String message){
        super(message);
    }

    public RepeatKillException(String message, Throwable cause){
        super(message,cause);
    }
}
