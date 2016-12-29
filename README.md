# 1051_F721000_2
* pin table已經定好了盡量別動到
* 剩下地雷生成、遊戲勝利判定、遊戲失敗判定跟advanced function
* 剩下的拜託啦
## main
* 主輸出模組
* input
    * clock
    * reset
    * switch：0->暫停，1->繼續
    * keycol：keypad輸入控制
    * button：所在區域控制
* output
    * keyrow：keypad讀取控制
    * row：led陣列row
    * col：led陣列col
    * led
    * hr, min, sec：七段輸出
* local var
    * area：所在區域
    * dot：keypad輸入值
    * finish：0->遊戲中，1->遊戲結束
### mat
* local var
    * mine：地雷位置儲存
### keypad
### button
### led
### timer
* 內有seg_decoder
