-- データベース
-- 
CREATE DATABASE exam COLLATE utf8mb4_general_ci;

-- examデータベースを選択
-- 
USE exam;

-- 質問テーブル
-- 
CREATE TABLE exam (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT '主キー',
    title VARCHAR(100) NOT NULL DEFAULT '' COMMENT '問題タイトル',
    description TEXT COMMENT '解説文書',
    answer1 VARCHAR(100) NOT NULL DEFAULT '' COMMENT '解答1',
    answer2 VARCHAR(100) NOT NULL DEFAULT '' COMMENT '解答2',
    answer3 VARCHAR(100) NOT NULL DEFAULT '' COMMENT '解答3',
    answer4 VARCHAR(100) NOT NULL DEFAULT '' COMMENT '解答4',
    correct TINYINT	NOT NULL DEFAULT 0 COMMENT '正解番号'
);
-- 質問内容
-- 
INSERT INTO exam (id,title,description,answer1,answer2,answer3,answer4,correct) VALUES 
(1,'玉子には殻が赤いものと白いものがありますが、両者の違いはなんでしょうか？','<em>何も変わらない</em><br><br>玉子には殻の色は白色であれば白色レグホンのような白玉鶏、赤色であればロードアイランドレッドなどの赤玉鶏のように鶏の種類で決まるため、栄養価、味、賞味期限については基本的に何も変わりません。<br>ただし、鶏を育てる農場のこだわりによっては違いが生まれるため、ぜひいろいろと食べ比べてみてはいかがでしょうか。','栄養価','味','賞味期限','何も変わらない',4),
(2,'一般的な白と黒のサッカーボールは5角形と6角形のパネルで出来ていますが、パネルは合わせて何枚使われているでしょうか？','<em>32枚</em><br><br>一般的なサッカーボールは正5角形が12枚、正6角形が20枚の合計32枚のパネルで作られています。<br>ただし、サッカーボールには真球性という限りなく完璧な球体であることが重要であるため2006年のワールドカップからは14枚、その後もさらにパネル数を減らし、より蹴り心地の向上が図られています。<br>サッカーを見る際にはそちらも合わせて見てみるといっそう楽しめますよ。','15枚','22枚','32枚','38枚',3),
(3,'髪の毛は1年でどれくらい伸びるでしょうか？','<em>12cm</em><br><br>髪の毛は1日で0.3～0.4mmほど伸びると言われており、そこから平均すると1週間で2.5mm、1ヵ月で約1cm、1年で約12cmほどになる計算です。<br>髪の毛は全体で約10万本生えており9割が成長期であることから、その長さを合計すると1年間で約100kmになると言われています。<br>髪の毛が体の中でもとくに新陳代謝が活発なのがわかりますよね。','6cm','8cm','12cm','20cm',3),
(4,'イカの足は何本あるでしょうか？','<em>8本</em><br><br>その見た目からタコは8本、イカは10本の足と思われがちですが、実はイカの足の数も8本です。<br>10本に見えるうちの2本は触腕と呼ばれるもので、獲物を捕まえる役割から足ではなく腕とカウントします。<br>よく見ると他の8本とは形も長さも違うため、ぜひ観察して見てくださいね。','2本','4本','8本','10本',3),
(5,'闘牛において、牛は何に反応して暴れているでしょうか？','<em>布が動く様子</em><br><br>赤い色に反応して暴れていると思われがちですが、実は牛の視界はモノクロのため色を判別できません。<br>牛は天敵から身を守るため見慣れないものや動くものに反応するため、その習性からヒラヒラと動く布を警戒し突進します。<br>そのため布の色は関係ありませんが、闘牛では血や危険なものをイメージさせる赤を使うことで人間の方を興奮させる、とされています。','闘牛士の声','布が動く様子','赤い布','観客の声',2),
(6,'スーツの袖のボタンは、もともとどんな理由で付けられたでしょうか？','<em>鼻水を拭かないため</em><br><br>スーツの袖のボタンの由来は、もともとはフランスの英雄として知られるナポレオンであると言われています。<br>フランスがロシア侵攻をした際に隊員たちがあまりの寒さからジャケットの袖で鼻水を拭いていたそうで、侵攻する際にどの隊員の袖も鼻水でカピカピになっていたことから、袖で鼻水が拭けないように金属を付けた、という説が有力です。','飾り','鼻水を拭かないため','予備のボタン','袖口の太さを変えるため',2),
(7,'1本の鉛筆をすべて使い切るとどれくらいの長さの線が引けるでしょうか？','<em>50km</em><br><br>HBの鉛筆を使い切るまでに引ける線の長さは約50kmとされています。<br>一定の条件下での数値でもあるため現実的とは言えませんが、それでも他の筆記用具に比べてダントツの長さのため、非常に経済的と言えるのではないでしょうか。','500m','800m','50km','100km',3);
-- 解答テーブル
-- 
CREATE TABLE answer (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT '主キー',
    no INT NOT NULL COMMENT '回数',
    exam_id INT NOT NULL COMMENT '質問テーブルへの外部キー',
    answer TINYINT NULL DEFAULT NULL COMMENT '解答(未回答時NULL)',
    is_correct TINYINT NOT NULL DEFAULT 0 COMMENT '1:正解/0:不正解'
);
-- no + exam_id の組み合わせをユニーク制約
-- 
ALTER TABLE `answer` ADD UNIQUE(`no`, `exam_id`);

-- 
INSERT INTO answer (no,exam_id,answer) VALUES
(1,1,2),
(1,2,2),
(1,3,2),
(1,4,2),
(1,5,2),
(1,6,2),
(1,7,NULL);

-- ここまでデータベース構築とサンプルデータ登録

-- 問題一覧を返す
SELECT * FROM exam ORDER BY id ASC;

-- 指定した番号の問題を1問返す
-- LIMIT 番号(0～),行数
SELECT * FROM exam ORDER BY id ASC LIMIT 1,1;
-- → 2番目の問題を返す


-- 次の解答回数を返す
-- 
SELECT IFNULL(MAX(no),0) + 1 AS next_no FROM answer;

-- 解答一覧と正解番号を返す
SELECT a.*,e.correct FROM answer AS a LEFT OUTER JOIN exam AS e ON a.exam_id = e.id WHERE a.no = 1;

-- 問題一覧と正解/不正解を返す
SELECT e.*,a.answer,a.is_correct FROM answer AS a LEFT OUTER JOIN exam AS e ON a.exam_id = e.id WHERE a.no = 1 ORDER BY e.id ASC;

-- 解答一覧と正解確認
-- 
SELECT
    *,
    (SELECT correct FROM exam AS e WHERE e.id = a.exam_id ) = a.answer AS check_answer
FROM
    answer AS a
WHERE
    no = 1
ORDER BY 
    exam_id ASC;

-- 答え合わせ
--  answerがNULLの時に更新対象から外す
UPDATE answer a SET is_correct = ((SELECT correct FROM exam e WHERE e.id = a.exam_id ) = a.answer) WHERE no = 1 AND answer IS NOT NULL;


