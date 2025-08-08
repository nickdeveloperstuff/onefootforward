# Locked Dependency Versions

This document describes the locked dependency versions for the Superdupernova project.

## System Requirements

### Exact Versions Required
- **Elixir:** 1.18.4
- **Erlang/OTP:** 28.0.1

These exact versions are specified in:
- `.tool-versions` - for asdf version manager
- `mix.exs` - project configuration

## Core Framework Versions

### Ash Framework Stack
- **ash:** 3.5.33
- **ash_phoenix:** 2.3.12
- **ash_postgres:** 2.6.14
- **ash_authentication:** 4.9.9
- **ash_authentication_phoenix:** 2.10.5
- **ash_admin:** 0.13.13
- **ash_oban:** 0.4.10
- **ash_events:** 0.4.3
- **ash_state_machine:** 0.2.12
- **ash_paper_trail:** 0.5.6
- **ash_cloak:** 0.1.6
- **ash_ai:** 0.2.9

### Phoenix Framework Stack
- **phoenix:** 1.8.0-rc.4 (override: true)
- **phoenix_live_view:** 1.1.2
- **phoenix_ecto:** 4.6.5
- **phoenix_html:** 4.2.1
- **phoenix_live_reload:** 1.6.0 (dev only)
- **phoenix_live_dashboard:** 0.8.7

### Database
- **ecto_sql:** 3.13.2
- **postgrex:** 0.21.1

### Asset Building
- **esbuild:** 0.10.0 (runtime in dev)
- **tailwind:** 0.3.1 (runtime in dev)
- **heroicons:** github tag v2.2.0

## How Version Locking Works

### 1. Exact Version Constraints
All dependencies in `mix.exs` use exact version constraints (`==`) instead of flexible ones (`~>`).
This ensures:
- No automatic updates during `mix deps.get`
- 100% reproducible builds across all environments
- No micro or patch updates without explicit changes

### 2. Version Management Files
- **mix.lock**: Committed to version control, contains exact resolved versions
- **.tool-versions**: Ensures same Elixir/Erlang versions across developers using asdf
- **mix.exs**: Updated to use exact versions matching mix.lock

### 3. Testing Process
After locking versions, the following verification was performed:
1. `mix deps.clean --all` - Remove all dependencies
2. `mix deps.get` - Fetch exact versions
3. `mix deps.compile` - Compile all dependencies
4. `mix compile` - Compile project
5. `mix setup` - Run full setup process

All steps completed successfully with no errors.

## Maintaining Version Consistency

### For New Developers
1. Install asdf version manager
2. Run `asdf install` in project root (uses .tool-versions)
3. Run `mix setup` to install dependencies

### Updating Dependencies
To update a dependency:
1. Change the version in `mix.exs` to the new exact version
2. Run `mix deps.get` to fetch the new version
3. Test thoroughly
4. Commit both `mix.exs` and `mix.lock`

### Important Notes
- NEVER use flexible version constraints (`~>`, `>=`, etc.)
- ALWAYS use exact versions (`==`)
- ALWAYS commit `mix.lock` to version control
- ALWAYS test after any dependency changes

## Complete Dependency List

All 80+ dependencies are locked to exact versions:
- usage_rules: 0.1.23
- bcrypt_elixir: 3.3.2
- picosat_elixir: 0.2.3
- sourceror: 1.10.0
- oban: 2.19.4
- oban_web: 2.11.4
- cloak: 1.1.4
- igniter: 0.6.25
- swoosh: 1.19.5
- req: 0.5.15
- telemetry_metrics: 1.1.0
- telemetry_poller: 1.3.0
- gettext: 0.26.2
- jason: 1.4.4
- dns_cluster: 0.2.0
- bandit: 1.7.0
- tidewave: 0.2.0 (dev only)
- lazy_html: 0.1.4 (test only)

(Plus all transitive dependencies locked in mix.lock)

## Benefits of This Approach

1. **100% Reproducible Builds** - Every developer and CI/CD pipeline uses exact same versions
2. **No Surprise Updates** - Dependencies won't change unless explicitly updated
3. **Predictable Behavior** - Same code runs same way everywhere
4. **Easier Debugging** - Version differences eliminated as potential issue source
5. **Compliance Ready** - Full version traceability for audits

## CI/CD Configuration

For GitHub Actions or other CI systems, ensure:
```yaml
- uses: erlef/setup-beam@v1
  with:
    elixir-version: '1.18.4'
    otp-version: '28.0.1'
```

## Last Updated
- Date: 2025-08-08
- All versions tested and working perfectly