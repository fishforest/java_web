<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 1200px;
        }
        h2 {
            color: #333;
        }
        .school-list {
            list-style-type: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .school-item {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin: 10px;
            padding: 15px;
            width: 250px;
            text-align: center;
        }
        .school-item h3 {
            margin: 10px 0;
            font-size: 18px;
            color: #333;
        }
        .school-item p {
            font-size: 14px;
            color: #666;
        }
        .school-item a {
            display: inline-block;
            margin-top: 10px;
            margin-bottom: 20px;
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
        }
        .school-item a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>C9高校列表</h2>
    <ul class="school-list">
        <li class="school-item">
            <h3>清华大学</h3>
            <p>清华大学是中国顶尖的高等学府之一，位于北京市，以工程技术见长，培养了很多人才。</p>
            <a href="school_detail?id=清华大学">点击了解更多</a>
        </li>
        <li class="school-item">
            <h3>北京大学</h3>
            <p>北京大学是中国最著名的高等学府之一，位于北京市，以人文社会科学见长。</p>
            <a href="school_detail?id=北京大学">点击了解更多</a>
        </li>
        <li class="school-item">
            <h3>浙江大学</h3>
            <p>浙江大学是一所以工为主、理、经、管、文、法、艺术、教育等多学科协调发展的综合性大学，位于浙江省杭州市。</p>
            <a href="school_detail?id=浙江大学">点击了解更多</a>
        </li>
        <li class="school-item">
            <h3>华中科技大学</h3>
            <p>华中科技大学位于湖北省武汉市，是一所以工为主，理工结合，理、工、文、医、经、法、教育、艺术、哲学等多学科协调发展的综合性大学。</p>
            <a href="school_detail?id=华中科技大学">点击了解更多</a>
        </li>
        <li class="school-item">
            <h3>上海交通大学</h3>
            <p>上海交通大学位于中国上海市，是一所以工为主，理工结合，管、文、经、法、教育、艺术、医学等多学科协调发展的综合性大学。</p>
            <a href="school_detail?id=上海交通大学">点击了解更多</a>
        </li>
        <li class="school-item">
            <h3>哈尔滨工业大学</h3>
            <p>哈尔滨工业大学位于中国黑龙江省哈尔滨市，是一所以工为主，理工结合，管、文、经、法、教育、艺术等多学科协调发展的综合性大学。</p>
            <a href="school_detail?id=哈尔滨工业大学">点击了解更多</a>
        </li>
        <li class="school-item">
            <h3>西安交通大学</h3>
            <p>西安交通大学位于中国陕西省西安市，是一所以工为主，理工结合，管、文、经、法、教育、艺术、医学等多学科协调发展的综合性大学。</p>
            <a href="school_detail?id=西安交通大学">点击了解更多</a>
        </li>
        <li class="school-item">
            <h3>南京大学</h3>
            <p>南京大学位于中国江苏省南京市，是一所以文理为主，多学科协调发展的综合性大学。</p>
            <a href="school_detail?id=南京大学">点击了解更多</a>
        </li>
        <li class="school-item">
            <h3>复旦大学</h3>
            <p>复旦大学位于中国上海市，是一所以文理为主，多学科协调发展的综合性大学。</p>
            <a href="school_detail?id=复旦大学">点击了解更多</a>
        </li>
    </ul>
</div>
</body>
</html>