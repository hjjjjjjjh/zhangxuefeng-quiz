# 张雪峰说 · 智能志愿百科

> 「社会就是一个大筛子，用学历筛孩子，用房子筛父母，用工作筛家庭。」

用张雪峰的思维框架帮你分析高考志愿、考研规划、就业方向。

## 功能

| 功能 | 说明 |
|------|------|
| 百科问答 | 60+专业、30+大学、大学+专业组合、省份+分数定位 |
| 职业测评 | 8 道题，性格标签 + 3 个推荐专业 + 分享结果 |
| 专业数据库 | 60+ 专业，就业率/月薪/考研/对口率，搜索补全 |
| 联网搜索 | DuckDuckGo 实时搜索（本地版） |
| 志愿填报 | 31 个省份 × 7 个分数档位，具体学校推荐 |

## 快速开始

### Windows 用户

双击 **`启动.bat`**，自动检查环境 + 安装依赖 + 打开浏览器。

### Mac / Linux

```bash
git clone https://github.com/ZhangYuanJie-SJTU/zhangxuefeng-quiz.git
cd zhangxuefeng-quiz
pip install flask flask-cors anthropic ddgs
python app.py
```

浏览器自动打开 http://localhost:5000

### 在线体验（无需安装）

https://zhangyuanjie-sjtu.github.io/html-pages/zhangxuefeng-quiz/

> 线上版是纯静态页面，60+专业数据 + 30+大学 + 测评。无需 API Key。

## 环境要求

| 项目 | 要求 | 说明 |
|------|------|------|
| Python | 3.8+ | [下载](https://www.python.org/downloads/) |
| Flask | 自动安装 | `启动.bat` 自动处理 |
| API Key | 可选 | 百科问答需要，数据库和测评不需要 |

**API Key 配置**（仅百科问答需要）：
```bash
# 方式1：环境变量
export ANTHROPIC_API_KEY=sk-xxx

# 方式2：Windows 系统设置 → 环境变量
# 添加 ANTHROPIC_API_KEY = sk-xxx
```

没有 API Key 也能用：专业数据库（60+专业）、职业测评、大学查询 全部可用。

## 使用示例

```
问专业：  "计算机就业前景"
问大学：  "华科计算机怎么样"
问组合：  "武理工测控技术与仪器"
问志愿：  "江苏600分"
问话题：  "考公还是考研" "AI会取代哪些专业"
做测评：  切到「职业测评」标签
```

## 项目结构

```
zhangxuefeng-quiz/
├── app.py              # 后端：Flask + AI + 联网搜索
├── static/
│   └── index.html      # 前端：数据+引擎+UI（纯静态也可独立运行）
├── requirements.txt    # Python 依赖
├── 启动.bat            # Windows 一键启动（环境自检+自动安装）
└── README.md
```

## 技术栈

- 后端：Python + Flask + Gunicorn
- AI：Anthropic SDK（兼容任何 OpenAI-compatible API）
- 搜索：DuckDuckGo（免费，无需 key）
- 前端：原生 HTML/CSS/JS（零框架，40KB 单文件）

## 基于

- [张雪峰.skill](https://github.com/alchaincyf/zhangxuefeng-skill) — 5 个心智模型、8 条决策启发式、完整表达 DNA

## License

MIT
