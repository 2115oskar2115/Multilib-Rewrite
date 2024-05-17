"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[331],{3905:(e,t,n)=>{n.d(t,{Zo:()=>p,kt:()=>h});var i=n(67294);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);t&&(i=i.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,i)}return n}function l(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function o(e,t){if(null==e)return{};var n,i,r=function(e,t){if(null==e)return{};var n,i,r={},a=Object.keys(e);for(i=0;i<a.length;i++)n=a[i],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(i=0;i<a.length;i++)n=a[i],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var s=i.createContext({}),u=function(e){var t=i.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):l(l({},t),e)),n},p=function(e){var t=u(e.components);return i.createElement(s.Provider,{value:t},e.children)},c="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return i.createElement(i.Fragment,{},t)}},d=i.forwardRef((function(e,t){var n=e.components,r=e.mdxType,a=e.originalType,s=e.parentName,p=o(e,["components","mdxType","originalType","parentName"]),c=u(n),d=r,h=c["".concat(s,".").concat(d)]||c[d]||m[d]||a;return n?i.createElement(h,l(l({ref:t},p),{},{components:n})):i.createElement(h,l({ref:t},p))}));function h(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var a=n.length,l=new Array(a);l[0]=d;var o={};for(var s in t)hasOwnProperty.call(t,s)&&(o[s]=t[s]);o.originalType=e,o[c]="string"==typeof e?e:r,l[1]=o;for(var u=2;u<a;u++)l[u]=n[u];return i.createElement.apply(null,l)}return i.createElement.apply(null,n)}d.displayName="MDXCreateElement"},76647:(e,t,n)=>{n.r(t),n.d(t,{contentTitle:()=>l,default:()=>c,frontMatter:()=>a,metadata:()=>o,toc:()=>s});var i=n(87462),r=(n(67294),n(3905));const a={},l=void 0,o={type:"mdx",permalink:"/Multilib-Rewrite/",source:"@site/pages/index.md",description:"Multilib Rewrite",frontMatter:{}},s=[{value:"Why Multilib exists?",id:"why-multilib-exists",level:2},{value:"Installation",id:"installation",level:2},{value:"Lets make it clear, its meant to be used with rojo!",id:"lets-make-it-clear-its-meant-to-be-used-with-rojo",level:3},{value:"How do i use it?",id:"how-do-i-use-it",level:2},{value:"Can i fork it?",id:"can-i-fork-it",level:2},{value:"Last note",id:"last-note",level:2}],u={toc:s},p="wrapper";function c(e){let{components:t,...n}=e;return(0,r.kt)(p,(0,i.Z)({},u,n,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("div",{align:"center"},(0,r.kt)("h1",null,"Multilib Rewrite")),(0,r.kt)("p",null,"A Roblox library that allows you to perform ",(0,r.kt)("em",{parentName:"p"},"simple")," task even ",(0,r.kt)("em",{parentName:"p"},"simplier"),". See ->\n",(0,r.kt)("a",{parentName:"p",href:"https://github.com/opkvysxct/Multilib-Rewrite/wiki/Multilib-Wiki"},(0,r.kt)("strong",{parentName:"a"},"Docs"))," for installation and usage help!"),(0,r.kt)("h2",{id:"why-multilib-exists"},"Why Multilib exists?"),(0,r.kt)("p",null,"I just found out that I use the same elements repeatedly across all my projects, and it became quite messy. So, I decided to develop a library that can manage these elements for me. The initial version was quite basic, to be honest, too basic. As a result, I made the decision to rewrite the entire library to include support for multiple modules and classes, among other things. This is why Multilib came into existence."),(0,r.kt)("h2",{id:"installation"},"Installation"),(0,r.kt)("h3",{id:"lets-make-it-clear-its-meant-to-be-used-with-rojo"},"Lets make it clear, its meant to be used with ",(0,r.kt)("a",{parentName:"h3",href:"https://rojo.space/"},"rojo"),"!"),(0,r.kt)("p",null,"first step :"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-bash"},"npm init\n")),(0,r.kt)("p",null,"second step :"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-bash"},"npm install @vysx/multilib\n")),(0,r.kt)("p",null,"Third step :\nadd a path to your default.project.json in rojo"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-json"},'"ReplicatedStorage": {\n    "Multilib" : {\n        "$path": "node_modules/@vysx/multilib"\n    },\n}\n')),(0,r.kt)("h2",{id:"how-do-i-use-it"},"How do i use it?"),(0,r.kt)("p",null,"You can find everything in the ",(0,r.kt)("a",{parentName:"p",href:"https://github.com/opkvysxct/Multilib-Rewrite/wiki/Multilib-Wiki"},"wiki"),".\nBut if You want just the loading schemat, then here you go!\nServer"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},'_G.MultilibGlobalSettings = require(game:GetService("ReplicatedStorage").Multilib)\n_G.MultilibGlobalSettings:InitServer(true/false) -- Logs\n')),(0,r.kt)("p",null,"Client"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},'_G.MultilibGlobalSettings = require(game:GetService("ReplicatedStorage").Multilib)\n_G.MultilibGlobalSettings:InitClient(true/false) -- Logs\n')),(0,r.kt)("h2",{id:"can-i-fork-it"},"Can i fork it?"),(0,r.kt)("p",null,"You're welcome!"),(0,r.kt)("h2",{id:"last-note"},"Last note"),(0,r.kt)("p",null,"Special thanks to ",(0,r.kt)("a",{parentName:"p",href:"https://github.com/NiceAssasin123"},"Fengee")," & ",(0,r.kt)("a",{parentName:"p",href:"https://github.com/AlwaysSunnySani"},"Sani")," for help."))}c.isMDXComponent=!0}}]);