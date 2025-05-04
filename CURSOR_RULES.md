# Dev Tools Project Rules and Standards

This file contains the rules and standards that must be followed when developing this project.

## 1. Project Structure
- Each service is placed in its own directory
- Each service must include these files:
  - `docker-compose.yaml` - Docker Compose configuration
  - `README.md` - Service documentation
  - `.env.example` - Example environment variables file

## 2. Docker Compose Standards
- Docker Compose files must use the `yaml` extension (not `yml`)
- The `version` field is not needed in Docker Compose files (it's optional in newer versions)
- Sensitive environment variables should be placed in the `.env` file (this file is included in `.gitignore`)
- An `.env.example` file should exist for each service to document required variables

## 3. Commit Messages
- Always use the Conventional Commit format:
  - `feat`: New feature
  - `fix`: Bug fix
  - `docs`: Documentation changes
  - `style`: Formatting changes (no code change)
  - `refactor`: Code refactoring without behavior change
  - `test`: Adding or fixing tests
  - `chore`: Routine updates and minor changes
- Example: `feat: add n8n workflow automation service`

## 4. Documentation
- Each service must have a `README.md` file that includes:
  - Brief description of the service
  - Usage and setup instructions
  - Required environment variables
  - Ports and access points
  - Useful links (official documentation, etc.)

## 5. Code Standards
- Code should be simple, readable, and maintainable
- Use common design patterns
- Maintain structural and visual consistency with existing code

## 6. Security and Performance
- Consider security, performance, and scalability issues in configurations
- Avoid exposing sensitive information in code and committed files

## 7. Management Script
- Use the `devtools.sh` script for project management
- This script enables starting and managing all services

## 8. Naming Conventions
- File and directory names should be meaningful and lowercase
- Use hyphens (`-`) to separate words in filenames

## 9. Independent Decision Making
- In case of ambiguity, make decisions based on the project context and your own logic
- Document the reasons for important decisions in commits or documentation

---

> 🎯 Main Goal: Maintaining quality, integrity, and reliability of all services and code in the project