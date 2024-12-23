function SearchItem() {
    var button = document.getElementById("searchButton");
    button.onclick = void (0);
    var query = document.getElementById("search").value;
    console.log(query);

    if (query.length < 3) { // 当输入小于3个字符时不进行搜索
        document.getElementById("J_keywordList").style.display = 'none';
        return;
    }

    let xhr = new XMLHttpRequest();
    xhr.open("GET", "/SearchServlet?SearchContent=" + encodeURIComponent(query), true);
    xhr.onreadystatechange = function () {
        console.log(xhr.responseText);
        if (xhr.readyState === 4 && xhr.status === 200) {
            var results = JSON.parse(xhr.responseText);
            displayResults(results);
            if (results.length > 0)
                addButtonClickListener(results[0].id);
        }
    };
    xhr.send();
}

function displayResults(results) {
    let resultsContainer = document.getElementById("J_keywordList");
    let resultList = resultsContainer.querySelector('.result-list');
    resultList.innerHTML = "";  // 清空之前的搜索结果

    if (results.length > 0) {
        resultsContainer.style.display = 'block';
        results.forEach(function (item) {
            // 创建一个 <li> 元素来包含每个搜索结果
            let li = document.createElement("li");

            // 创建一个 <a> 元素，将商品的名称作为链接
            let a = document.createElement("a");
            a.textContent = item.name;
            a.href = "/ShoppingCart?item=" + item.id; // 假设商品详情页面使用产品 ID 作为查询参数
            a.classList.add("result-item");

            // 将 <a> 标签添加到 <li> 元素中
            li.appendChild(a);

            // 将 <li> 元素添加到搜索结果列表中
            resultList.appendChild(li);
        });
    } else {
        resultsContainer.style.display = 'none';
        resultList.innerHTML = ''; // 如果没有结果，清空列表

        // 添加一个"没有结果"的提示
        let li = document.createElement("li");
        li.textContent = "没有找到相关商品";
        resultList.appendChild(li);
    }
}

function addButtonClickListener(itemId) {
    let button = document.getElementById("searchButton");
    button.onclick = function () {
        window.open("/ShoppingCart?item=" + itemId);  // 跳转到第一个搜索结果的URL
    };
}