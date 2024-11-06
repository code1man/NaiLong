function search() {
    var query = document.getElementById("search").value;
    console.log(query);

    if (query.length < 3) { // 当输入小于3个字符时不进行搜索
        document.getElementById("J_keywordList").style.display = 'none';
        return;
    }

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/SearchServlet?SearchContent=" + encodeURIComponent(query), true);
    xhr.onreadystatechange = function () {
        console.log(xhr.responseText);
        if (xhr.readyState === 4 && xhr.status === 200) {
            var results = JSON.parse(xhr.responseText);
            displayResults(results);
        }
    };
    xhr.send();
}

function displayResults(results) {
    var resultsContainer = document.getElementById("J_keywordList");
    var resultList = resultsContainer.querySelector('.result-list');
    resultList.innerHTML = "";  // 清空之前的搜索结果

    if (results.length > 0) {
        resultsContainer.style.display = 'block';
        results.forEach(function (item) {
            // 创建一个 <li> 元素来包含每个搜索结果
            var li = document.createElement("li");

            // 创建一个 <a> 元素，将商品的名称作为链接
            var a = document.createElement("a");
            a.textContent = item.name;
            a.href = "/ShoppingCart?item=" + item.id; // 假设商品详情页面使用产品 ID 作为查询参数
            a.classList.add("result-item");  // 添加样式类，方便你进行样式设置

            // 将 <a> 标签添加到 <li> 元素中
            li.appendChild(a);

            // 将 <li> 元素添加到搜索结果列表中
            resultList.appendChild(li);
        });
    } else {
        resultsContainer.style.display = 'none';
    }
}