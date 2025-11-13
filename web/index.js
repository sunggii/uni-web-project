/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//นับคนเข้าเว็บ
window.onload = function () {
    // อ่านค่า pageLoadCount จาก cookie (ถ้ามี)
    let count = 0;
    //document.cookie คืนสตริงของคุกกี้ทั้งหมดที่เก็บอยู่ในโดเมน/path ปัจจุบัน
    //แยกสตริงออกเป็น array โดยใช้ "; "
    const cookies = document.cookie.split("; ");
    let hasVisited = false;

    for (let i = 0; i < cookies.length; i++) {
        // เอาข้อมูลคุกกี้แต่ละตัวออกมา เช่น "pageLoadCount=5"
        let cookie = cookies[i];

        // แยกชื่อกับค่าของคุกกี้ด้วยเครื่องหมาย "="
        let parts = cookie.split("=");  // parts[0] = ชื่อคุกกี้, parts[1] = ค่าคุกกี้
        let name = parts[0];            // ชื่อคุกกี้ เช่น "pageLoadCount"
        let value = parts[1];           // ค่าคุกกี้ เช่น "5"

        // ถ้าคุกกี้ชื่อนี้คือ "pageLoadCount"
        if (name === "pageLoadCount") {
            // แปลงค่าจาก string เป็นตัวเลข แล้วเก็บไว้ในตัวแปร count
            count = parseInt(value);
        }

        // ถ้าคุกกี้ชื่อนี้คือ "hasVisited"
        if (name === "hasVisited") {
            // ตั้งค่าให้รู้ว่าผู้ใช้เคยเข้ามาแล้ว
            hasVisited = true;
        }
    }

    // ถ้ายังไม่เคยเข้ามา (ไม่มี cookie hasVisited)
    if (!hasVisited) {
        count++;
        //อายุ cookie 7 วัน
        document.cookie = "pageLoadCount=" + count + "; max-age=" + (60 * 60 * 24 * 7) + "; path=/";
        document.cookie = "hasVisited=true; max-age=" + (60 * 60 * 24 * 7) + "; path=/";
    }

    // แสดงผล
    const display = document.getElementById('loadCount');
    if (display) {
        display.textContent = "คุณคือผู้เข้าชมคนที่ " + count + " 🎉";
    }
};
