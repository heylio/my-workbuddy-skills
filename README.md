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
- `java-development` 的 `SKILL.md` 是花店项目适配版；配套的 `core/`、`spring-boot/`、`testing/`、`code-review/`、`jvm/`、`build-tools/`、`assets/`、`examples/` 等规则目录从上游同步。适配版主文件与上游规则目录配套使用。
- `spring-scaffold` 继续负责项目初始骨架；`java-development` 负责初始化后的持续后端开发，二者互补。

## 同步说明

上游 Skills 的 `references/`、`scripts/`、`templates/`、`assets/` 等配套文件必须与对应 `SKILL.md` 一并同步；不能只复制主说明文件。可在 GitHub Actions 的 **Sync upstream skill support files** 工作流中点击 **Run workflow** 执行同步；也可在本地运行 `bash scripts/sync-upstream-skill-support.sh`。同步脚本只复制配套目录和许可/变更记录文件，保留本仓库适配后的 `SKILL.md`。`java-development` 为本仓库自包含适配版，不从上游覆盖。请遵循各上游项目的许可证和署名要求。
