#!/usr/bin/env python

import sentry_sdk

sentry_sdk.init(
    dsn="https://82113cb6e1d1757c0aef9715252ff9b7@o4506217482813440.ingest.sentry.io/4506224049061888",
    traces_sample_rate=1.0,
    profiles_sample_rate=1.0,
    environment="development",
)

try:
    file = open("license.key", "r")
    try:
        license_key = file.readline()
        if len(license_key) == 0:
            raise Exception("Invalid license key")
        
        print("Success")
    finally:
        file.close()
        
except Exception as e:
    sentry_sdk.capture_exception(e)
