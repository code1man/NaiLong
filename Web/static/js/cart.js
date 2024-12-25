let cartList = document.getElementById("J_miniCartList");
console.log(cartList);

if (cartList) {
    let cartItems = cartList.children;
    let currentCartListTotalCount = parseInt($('#CartListTotalCount').text()); // 购物车中商品总数
    let currentCartListTotalPrice = parseInt($('#CartListTotalPrice').text()); // 购物车中商品总价格
    if (cartItems && cartItems.length > 0) {
        for (let cartItem of cartItems) {
            console.log(cartItem);
            let currentCount = parseInt($('#ItemCount').text()); // 获取商品数量
            let currentTotalPrice = parseInt($('#ItemPrice').text()); // 获取商品总价格
            let ItemPrice = currentTotalPrice / currentCount; // 获取商品的价格
            let itemId = cartItem.getAttribute('data-item-id');  // 获取该商品的 ID

            let delBtn = cartItem.querySelector('.btn-del');

            delBtn.addEventListener("click", (event) => {
                let result = confirm("确定删除吗?");
                console.log(itemId);
                if (result) {
                    $.ajax({
                        type: "POST",  // 使用 POST 方法
                        url: `/RemoveItem?id=${itemId}&pageFrom=/mainForm`,
                        success: () => {
                            console.log("SUCCESS");

                            // 通过某些方法获取当前商品的数量和价格
                            currentCartListTotalCount -= currentCount;
                            currentCartListTotalPrice -= currentTotalPrice;

                            $('#topBarItemCount').text(`(${currentCartListTotalCount})`);

                            if (currentCartListTotalCount > 0) {
                                // 正确获取到当前删除项的父节点
                                cartList.removeChild(event.target.closest('li')); // 使用 event.target.closest 获取 li
                                $('#CartListTotalCount').text(currentCartListTotalCount);
                                $('#CartListTotalPrice').text(currentCartListTotalPrice);
                            } else {
                                $('#J_miniCartList').html('');  // 清空购物车商品列表
                                $('#J_miniCartListTotal').html('<div class="msg msg-empty">购物车中还没有商品，赶紧选购吧！</div>');
                            }
                        },
                        error: (xhr, status, error) => {
                            console.log("ERROR");
                            console.error(`Error: ${status}, ${error}`);
                            alert("删除失败");
                        }
                    });

                }
            });

            let i_btn = cartItem.querySelector(".count_i");
            let d_btn = cartItem.querySelector(".count_d");
            let itemCount = cartItem.querySelector(".item-count")
            let itemPrice = cartItem.querySelector(".item-price");

            i_btn.addEventListener("click", () => {
                currentCount++;
                currentCartListTotalCount++;
                currentTotalPrice += ItemPrice;
                currentCartListTotalPrice += ItemPrice;
                itemPrice.textContent = currentTotalPrice + '';
                itemCount.textContent = currentCount + '';
                $('#CartListTotalCount').text(currentCartListTotalCount);
                $('#CartListTotalPrice').text(currentCartListTotalPrice);
                $('#topBarItemCount').text(`(${currentCartListTotalCount})`)

                // 上传数据库进行保存
            });
            d_btn.addEventListener("click", (event) => {
                currentCount--;
                currentCartListTotalCount--;
                currentCartListTotalPrice -= ItemPrice;
                if (currentCount === 0) {
                    // 删除
                    let result = confirm("本次操作将将从购物车移除此商品，确定删除吗?");
                    if (result) {
                        $('#topBarItemCount').text(`(${currentCartListTotalCount})`);
                        if (currentCartListTotalCount > 0)
                            cartList.removeChild(event.target.closest('li'));
                        else {
                            currentCartListTotalPrice = 0;
                            $('#J_miniCartList').html('');  // 清空购物车商品列表
                            $('#J_miniCartListTotal').html('<div class="msg msg-empty">购物车中还没有商品，赶紧选购吧！</div>');
                        }
                    }
                } else {
                    itemPrice.textContent = currentTotalPrice + '';
                    itemCount.textContent = currentCount + '';
                    $('#CartListTotalCount').text(currentCartListTotalCount);
                    $('#CartListTotalPrice').text(currentCartListTotalPrice);
                    $('#topBarItemCount').text(`(${currentCartListTotalCount})`)
                }

                // 上传数据库进行保存
            })
        }
    }
}