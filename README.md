# 智能体 AI 漫游指南：从基础到系统（中文版）

> _The Hitchhiker's Guide to Agentic AI: From Foundations to Systems_ — 中文翻译版

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![LaTeX](https://img.shields.io/badge/LaTeX-XeLaTeX-green.svg)](https://www.latex-project.org/)
[![Pages](https://img.shields.io/badge/Pages-563-orange.svg)](#)
[![Language](https://img.shields.io/badge/Language-中文-red.svg)](#)

本项目是 Haggai Roitman 所著《The Hitchhiker's Guide to Agentic AI: From Foundations to Systems》一书的**非官方中文译本**。本译本作为衍生作品，与原文同样遵循 **CC BY-SA 4.0** 许可证。

全书 29 章、6 个板块、约 560 页，系统覆盖了从 Transformer 内部机制、GPU 训练系统、强化学习、对齐方法、推理模型，到智能体编排、多智能体协作与 Agentic UI 的完整技术栈。中文译本面向希望快速建立"从底层硬件 → 训练算法 → 智能体系统"完整图景的中文读者。

---

## 📚 全书结构

### **Part I — Foundations｜基础（第 1--3 章）**

构建后续所有章节所依赖的底层知识，从 Transformer 内部如何处理一段文本，到让训练成为可能的 GPU 硬件与分布式系统，再到强化学习的第一原理。读完后能回答："一段 Prompt 输入到 LLM 之后到底发生了什么？为什么训练一个 70B 模型至少要一个 8 卡节点？为什么 RL 在文本生成里也成立？"

### **Part II — RL Methods for LLMs｜面向 LLM 的 RL 方法（第 4--12 章）**

本书占比较大的部分，也是训练与对齐的核心。覆盖 PPO、DPO、GRPO 及其各种变体（KTO、IPO、ORPO、SimPO、DAPO、GSPO 等），以及 reward 模型训练、SFT 最佳实践、大规模 RLHF 系统架构与智能体的轨迹级 RL。每个算法都配有数学推导、直觉解释和可直接在 [TRL](https://github.com/huggingface/trl) 中跑起来的代码模板。

### **Part III — Reasoning｜推理（第 13 章）**

模型能力的最前沿——教 LLM "想清楚再回答"。重点不是单点算法，而是 RL 如何让思维链、自我验证、回溯这些"推理行为"自发涌现，以及测试时算力扩展（Test-Time Scaling）如何重写"模型规模 → 能力"的旧公式（DeepSeek-R1、o1/o3、QwQ、PRM、MCTS）。

### **Part IV — Evaluation｜评估（第 14 章）**

回答"上面这些东西到底有没有真的变好"。把 LLM 评估从 BLEU/perplexity 这种古典指标，推到 LLM-as-Judge、多维偏好、ELO 排名、智能体 benchmark 与污染检测这套现代体系。

### **Part V — Agentic AI｜智能体 AI（第 15--26 章）**

篇幅最大的部分，从一个训练好的模型出发，逐层加上 **知识层（RAG）→ 记忆层 → 运行时层（编排/Harness）→ 协作层（MCP/A2A/多智能体）→ 人机交互层（Agentic UI）**，最终走到一个可被部署的自主系统。每章基本可以独立阅读，也涵盖了主流开发框架（LangGraph、CrewAI、AutoGen、OpenAI Agents SDK、Google ADK）的对比。

### **Part VI — Assessment & Reference｜自测与参考（第 27--29 章）**

工具书性质的收尾。**108 道**测验题覆盖了前面所有主题，每题都配有详细解答；快速参考章整合关键公式、API 与失败模式诊断；最后一章展望未来方向。建议在通读完前五部分后，把测验题当"考研真题"做一遍——很多概念在解答中才会被串起来。

---

## 🚀 构建

需要 **TeX Live 2024+** 与 **XeLaTeX**；macOS 默认 CJK 字体即可，其他系统可在 `book.tex` 第 14--16 行换成 `Noto Serif CJK SC` 等。

```bash
make distclean && make
```

---

## 🌐 翻译策略

- **保留英文**：通用学术术语（Transformer、Token、Attention、Agent、Policy、Reward、Embedding、Prompt 等）、人名（如 Haggai Roitman、Geoffrey Hinton）、机构名（OpenAI、Anthropic、DeepMind、IBM、Google）、模型名（GPT-4、Llama-3、DeepSeek-R1、Qwen、Claude、Mistral）、数据集名（ImageNet、MMLU、HumanEval、MATH、GAIA）、协议名（MCP、A2A）。
- **首次出现给全称**：不常见英文缩写以 `中文（English Full Name, ABBR）` 形式出现，例如：监督微调（Supervised Fine-Tuning, SFT）、组相对策略优化（Group Relative Policy Optimization, GRPO）、可验证奖励的强化学习（Reinforcement Learning from Verifiable Rewards, RLVR）。
- **不常见中文译名保留原文**：例如 灾难性遗忘（Catastrophic Forgetting）、对齐税（Alignment Tax）、序列打包（Sequence Packing）。
- **代码本体、`\cite{}`/`\ref{}`/数学环境、tikzpicture 不译**；代码内 `#` 开头的注释会翻译为中文。

---

## 🤝 贡献与反馈

- **翻译错误 / 表达不当**：请提交 [GitHub Issue](https://github.com/Chasing1020/agentic-ai-guide-zh/issues) 或发邮件至 `chasing1020@gmail.com`。
- **改进建议**：欢迎 Pull Request；建议在 PR 描述里指明对应的章节、段落与原文位置。
- **术语统一**：如发现术语在不同章节翻译不一致，可在 Issue 中列出（这是最容易被人工漏掉的一类问题）。
- **新的章节翻译**：原作如有更新，欢迎认领章节并同步。

---

## 📜 版权与许可

本中文译本作为 Haggai Roitman 原作的衍生作品，依据 **[Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/)** 发布。

您可以自由地：

- ✅ **分享**（复制和再分发本材料于任何媒介或格式）
- ✅ **演绎**（修改、转换或基于本材料进行创作），用于任何目的（**包括商业用途**）

唯一前提是：

- **署名**：必须给出**原作者 Haggai Roitman** 与译者 **Chasing1020** 的署名，提供本许可证的链接，并指明是否做了修改。
- **相同方式共享**（ShareAlike）：如果您再分发或基于本材料创作新作品，必须以**相同的 CC BY-SA 4.0** 许可证发布。

📌 **关于原作权利**：原作《The Hitchhiker's Guide to Agentic AI: From Foundations to Systems》的全部版权归原作者 **Haggai Roitman** 所有。本译本未受到原作者的官方背书或审定；如发现翻译错误，应理解为模型的幻觉/译者的责任，与原作者无关。

📌 **关于 AI 辅助**：本译本在翻译过程中使用了大语言模型作为辅助工具，所有内容尽最大努力做了人工审校。

---

## 🙏 致谢

- **Haggai Roitman** —— 以 CC BY-SA 4.0 开放了这本极有价值的指南。
- 原书所引用的全部论文作者与开源社区 —— 这本指南站立在他们的肩膀上。
- 所有提交 Issue / PR 改进本译本的读者。

---

<p align="center">
  <i>"预测未来最好的方式，就是把它创造出来。"</i><br>
  — Alan Kay
</p>
