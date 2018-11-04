
package com.shukerullah.lotame;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.lotame.android.CrowdControl;
import com.lotame.android.CrowdControl.Protocol;

import java.io.IOException;

public class RNLotameModule extends ReactContextBaseJavaModule {


  public final String REACT_CLASS = "RNLotame";

  private final ReactApplicationContext reactContext;

  private CrowdControl ccHttp;

  public RNLotameModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return REACT_CLASS;
  }

  @ReactMethod
  public void initialize(int clientID, String domain) {
    ccHttp = new CrowdControl(reactContext, clientID, Protocol.HTTP, domain);
  }

  @ReactMethod
  public void startSession() {
    ccHttp.startSession();
  }

  @ReactMethod
  public void addBehaviorData(String type, String value) {
    ccHttp.add(type,value);
  }

  @ReactMethod
  public void sendBehaviorData() {
    if (ccHttp.isInitialized()) {
      try {
        ccHttp.bcp();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
}