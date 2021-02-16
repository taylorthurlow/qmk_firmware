#!/usr/bin/env bash

qmk json2c layout.json > keymap.c

cat >> keymap.c <<- EOM
void led_set_keymap(uint8_t usb_led) {
  if (!(usb_led & (1<<USB_LED_NUM_LOCK))) {
    register_code(KC_NUMLOCK);
    unregister_code(KC_NUMLOCK);
  }
}

EOM

