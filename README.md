# my-workbuddy-skills

个人开发工作流 Skills 集合。每个 Skill 的主说明文件统一放在 `skills/<skill-name>/SKILL.md`。

## Skills

| Skill | 本仓库路径 | 用途 | 上游来源 |
|---|---|---|---|
| frontend-ui-prototype | [SKILL.md](skills/frontend-ui-prototype/SKILL.md) | 快速构建前端 UI 原型 | https://github.com/0furkancolak/frontend-ui-prototype |
| frontend-design | [SKILL.md](skills/frontend-design/SKILL.md) | 前端界面设计与实现 | https://github.com/anthropics/skills/tree/main/skills/frontend-design |
| frontend-design-review | [SKILL.md](skills/frontend-design-review/SKILL.md) | 前端设计评审 | https://github.com/microsoft/skills/tree/main/.github/skills/frontend-design-review |
| database-schema-designer | [SKILL.md](skills/database-schema-designer/SKILL.md) | 数据库 Schema 设计 | https://github.com/JPeetz/agent-skills/tree/main/skills/data/database-schema-designer |
| spec-writer | [SKILL.md](skills/spec-writer/SKILL.md) | 编写需求与技术规格说明 | https://github.com/JPeetz/agent-skills/tree/main/skills/documentation-content/spec-writer |
| spring-scaffold | [SKILL.md](skills/spring-scaffold/SKILL.md) | Spring Boot 项目脚手架初始化 | https://github.com/Dancan254/spring-boot-skills/tree/main/skills/spring-scaffold |
| java-development | [SKILL.md](skills/java-development/SKILL.md) | Java/Spring Boot 后端持续开发、测试与维护（本仓库适配版） | https://github.com/zander-zyx/java-development-skill |
| playwright-e2e-testing | [SKILL.md](skills/playwright-e2e-testing/SKILL.md) | Playwright 端到端测试 | https://github.com/JPeetz/agent-skills/tree/main/skills/qa-testing/playwright-e2e-testing |
| anti-over-engineering | [SKILL.md](skills/anti-over-engineering/SKILL.md) | 避免过度设计 | https://github.com/JPeetz/agent-skills/tree/main/skills/development/anti-over-engineering |
| safe-refactor | [SKILL.md](skills/safe-refactor/SKILL.md) | 安全重构 | https://github.com/JPeetz/agent-skills/tree/main/skills/development/safe-refactor |

## 花店管理系统项目规范

- [花店管理系统 Skills 调用规范](docs/花店管理系统-Skill调用规范.md)：定义需求、原型、数据/API 设计、项目初始化、前后端开发、测试、重构、维护各阶段的 Skill 白名单和完成门槛。
- `java-development` 是根据候选上游项目的工作原则整理的本仓库适配版，当前为自包含单文件，不依赖上游的 `core/`、`spring-boot/`、`testing/` 等目录；它并非上游 34 条规则的完整镜像。
- `spring-scaffold` 继续负责项目初始骨架；`java-development` 负责初始化后的持续后端开发，二者互补。

## 同步说明

现有上游 Skills 中，部分可能引用 `references/`、`scripts/`、`templates/` 等配套文件；这些上游依赖尚未全部同步，使用前请查看对应上游目录。新增的 `java-development` 为本仓库自包含适配版。请遵循各上游项目的许可证和署名要求。
