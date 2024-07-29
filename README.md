# exam ‐ 4択問題システム

## データベース

以下2つのテーブルで管理を行う

<img src="image/データベースクラス.svg" width="75%">

### exam - 問題テーブル

問題がセットされている

<table>
<tbody>
 <tr>
  <th>title</th>
  <td>問題タイトル</td>
 </tr>
 <tr>
  <th>description</th>
  <td>解説文書</td>
 </tr>
 <tr>
  <th>answer1</th>
  <td>選択肢1</td>
 </tr>
 <tr>
  <th>answer2</th>
  <td>選択肢2</td>
 </tr>
 <tr>
  <th>answer3</th>
  <td>選択肢4</td>
 </tr>
 <tr>
  <th>answer4</th>
  <td>選択肢4</td>
 </tr>
 <tr>
  <th>correct</th>
  <td>正解番号</td>
 </tr>
</tbody>
</table>

### answer - 解答テーブル

<table>
<tbody>
 <tr>
  <th>no</th>
  <td>回数</td>
 </tr>
 <tr>
  <th>exam_id</th>
  <td>問題テーブルへの外部キー</td>
 </tr>
 <tr>
  <th>answer</th>
  <td>選択した解答</td>
 </tr>
 <tr>
  <th>is_correct</th>
  <td>正解:1/不正解:0</td>
 </tr>
</tbody>
</table>

## 画面遷移図

![](image/画面遷移図.svg)

## ユースケース図

![](image/ユースケース.svg)

### 表紙ページ

+ 解答ページへ移動する
+ 答え合わせページへ移動する

### 解答ページ

+ 4択の中から1つを選択する
+ 選択しないと次のページへは進めない
+ 次の問題へ移動する \
→ この時answerテーブルに保存する

### 答え合わせページ

+ 選択肢を強調する
+ 正しい選択の場合正解を表示する
+ 正しくない選択の場合正しくないことを表現すし、正解を表す
+ 確認のため「前へ」と「次へ」ボタンが有り見直す事が可能