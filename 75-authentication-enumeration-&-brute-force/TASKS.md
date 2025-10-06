# TASKS — Step-by-step answers & useful commands
## Task 1 — Introduction & Setup

- What to do: Start the machine, add enum.thm to /etc/hosts, open site after ~3 minutes.

- No answers required — confirm machine started.

## Task 2 — Authentication Enumeration

- Goal: Identify how the application handles unknown vs known usernames.

Steps & commands

- Browse to the login/forgot-password pages while capturing with Burp.

- Observe responses to invalid vs valid usernames. Example with curl (replace values):
```markdown
curl -i -s -X POST http://enum.thm/login -d 'username=nonexistent&password=test'
```
- Send the same request but with a guessed (or disclosed) username. Compare response body and status codes.

- What to look for: verbose messages like "User does not exist" vs "Incorrect password" — these messages allow username enumeration.

## Task 3 — Enumerating Users via Verbose Errors

Approach

- Create a small script or use Burp Intruder to iterate a username list against the login or password-reset endpoint. Monitor response length, status or specific error strings.

Example using curl + bash
```markdown
for u in $(cat usernames.txt); do
  R=$(curl -s -X POST -d "username=$u" http://enum.thm/forgot-password)
  if echo "$R" | grep -q "We have sent"; then
    echo "VALID: $u"
  fi
done
```
Burp Intruder method

- Place username field as payload position, use a small wordlist, and grep for a distinct response string or length.

## Task 4 — Exploiting Vulnerable Password Reset Logic

Typical vulnerable flow

- The reset endpoint reveals whether an email/username exists.

- Predictable reset tokens or insecure token handling can allow attacker to reset passwords.

What to try

- If reset token is returned or predictable in the response, try to use it to set a new password.

- Check for direct object references to tokens in query strings.

Example

- If a reset?token=abcd link is shown for a valid user, try iterating tokens or testing predictable patterns.

## Task 5 — Exploiting HTTP Basic Authentication

Check for Basic Auth

- If a protected endpoint returns WWW-Authenticate: Basic, use curl -I to detect.
```markdown
curl -I http://enum.thm/protected
```
- Try common credentials or use hydra
```markdown
hydra -L usernames.txt -P passwords.txt enum.thm http-get /protected
```
- Using curl to test a single combo
```markdown
curl -u user:password http://enum.thm/protected
```
## Task 6 — OSINT

Use OSINT to augment username/password guesses

- Search for email patterns: first.last@domain.com, first@domain.com.

- Combine names from LinkedIn/GitHub with year of joining or common numbers.

## Task 7 — Conclusion

Summarize what allowed access (verbose errors, weak reset logic, Basic Auth) and propose remediation (standardize error messages, rate limiting, multi-factor, secure token generation).
