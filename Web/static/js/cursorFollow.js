//图标
const mouseFollowIcon = document.getElementById('mouse-follow-icon');

// 将图标初始位置设置为 (0, 0)
mouseFollowIcon.style.top = '0px';
mouseFollowIcon.style.left = '0px';

// 获取图标的宽度和高度
const iconWidth = mouseFollowIcon.offsetWidth / 2;
const iconHeight = mouseFollowIcon.offsetHeight / 2;


//--------------------------------------------------------------------------------------
//鼠标
const customCursor = document.createElement('div');
customCursor.classList.add('custom-cursor');
document.body.appendChild(customCursor);

customCursor.style.top = '0px';
customCursor.style.left = '0px';
const iconWidth1 = customCursor.offsetWidth / 2;
const iconHeight1 = customCursor.offsetHeight / 2;


// 设置移动延迟时间（以毫秒为单位）
const delay = 100; // 例如：100毫秒
document.addEventListener('mousemove', (event) => {
    const x = event.clientX;
    const y = event.clientY;

    //小圆点移动
    customCursor.style.transform = `translate(${x - iconWidth1}px, ${y - iconHeight1}px)`; // 居中显示
    // 设置鼠标跟随图标的位置，居中显示
    // 使用 setTimeout 延迟 mouseFollowIcon 的移动
    setTimeout(() => {
        mouseFollowIcon.style.transform = `translate(${x - iconWidth}px, ${y - iconHeight}px)`; // 居中显示
    }, delay);
});





